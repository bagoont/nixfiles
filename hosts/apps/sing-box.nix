{
  pkgs,
  config,
  ...
}: {
  sops.secrets = {
    "vless/address" = {group = "users";};
    "vless/server_name" = {group = "users";};
    "vless/uuid" = {group = "users";};
    "vless/public_key" = {group = "users";};
    "vless/short_id" = {group = "users";};
  };

  networking.firewall.trustedInterfaces = ["tun0"];
  services.sing-box = {
    enable = true;
    package = pkgs.sing-box;
    settings = {
      log = {
        level = "warn";
      };

      inbounds = [
        {
          type = "tun";
          interface_name = "tun0";
          domain_strategy = "ipv4_only";
          address = ["172.16.250.1/30"];
          auto_route = true;
          strict_route = true;
          sniff = true;
        }
      ];

      outbounds = [
        {
          type = "direct";
          tag = "direct";
        }

        {
          tag = "proxy";
          type = "vless";
          server = {_secret = config.sops.secrets."vless/address".path;};
          server_port = 443;
          uuid = {_secret = config.sops.secrets."vless/uuid".path;};
          flow = "xtls-rprx-vision";
          tls = {
            enabled = true;
            insecure = false;
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
      ];
      route = {
        final = "direct";
        auto_detect_interface = true;
        rules = [
          {
            rule_set = ["refilter_domains" "refilter_ipsum"];
            outbound = "proxy";
          }
        ];
        rule_set = [
          {
            tag = "refilter_domains";
            type = "remote";
            format = "binary";
            url = "https://github.com/1andrevich/Re-filter-lists/releases/latest/download/ruleset-domain-refilter_domains.srs";
            download_detour = "direct";
          }
          {
            tag = "refilter_ipsum";
            type = "remote";
            format = "binary";
            url = "https://github.com/1andrevich/Re-filter-lists/releases/latest/download/ruleset-ip-refilter_ipsum.srs";
            download_detour = "direct";
          }
        ];
      };
      experimental = {
        cache_file = {
          enabled = true;
        };
      };
    };
  };
}
