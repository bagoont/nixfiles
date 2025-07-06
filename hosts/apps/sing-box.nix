{config, ...}: {
  sops = {
    secrets = {
      "vless/server" = {};
      "vless/uuid" = {};
      "vless/server_name" = {};
      "vless/public_key" = {};
      "vless/short_id" = {};
    };
  };

  services.sing-box = {
    enable = true;
    settings = {
      networkConfig = {
        log = {
          level = "warn";
        };

        dns = {
          servers = [
            {
              tag = "quad9-dns";
              address = "tls://dns.quad9.net";
              address_resolver = "local-dns";
              detour = "vless-out";
            }
            {
              tag = "local-dns";
              address = "local";
              detour = "direct-out";
            }
          ];
          rules = [
            {
              outbound = "any";
              server = "local-dns";
            }
          ];
        };

        inbounds = [
          {
            type = "tun";
            inet4_address = "172.16.0.1/30";
            auto_route = true;
            strict_route = true;
            sniff = true;
          }
        ];

        outbounds = [
          {
            type = "direct";
            tag = "direct-out";
          }
          {
            type = "vless";
            tag = "vless-out";
            server = {_secret = config.sops.secrets."vless/server".path;};
            server_port = 443;
            uuid = {_secret = config.sops.secrets."vless/uuid".path;};
            flow = "xtls-rprx-vision";

            tls = {
              enabled = true;
              server_name = {_secret = config.sops.secrets."vless/server_name".path;};

              utls = {
                enabled = true;
                fingerprint = "chrome";
              };

              reality = {
                enabled = true;
                public_key = {_secret = config.sops.secrets."vless/public_key".path;};
                short_id = {_secret = config.sops.secrets."vless/short_id".path;};
              };
            };
          }

          {
            type = "dns";
            tag = "dns-out";
          }
        ];

        route = {
          rules = [
            {
              rule_set = "antizapret";
              outbound = "vless-out";
            }
            {
              protocol = "dns";
              outbound = "dns-out";
            }
          ];
          rule_set = [
            {
              tag = "antizapret";
              type = "remote";
              format = "binary";
              url = "https://github.com/savely-krasovsky/antizapret-sing-box/releases/latest/download/antizapret.srs";
              download_detour = "vless-out";
            }
          ];
          auto_detect_interface = true;
        };

        experimental = {
          cache_file = {
            enabled = true;
          };
        };
      };
    };
  };
}
