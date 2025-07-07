{
  pkgs,
  config,
  ...
}: {
  services.sing-box = {
    sops.secrets = {
      "vless/address" = {group = "users";};
      "vless/port" = {group = "users";};
      "vless/server_name" = {group = "users";};
      "vless/uuid" = {group = "users";};
      "vless/public_key" = {group = "users";};
      "vless/short_id" = {group = "users";};
    };

    package = pkgs.sing-box;
    services.sing-box.settings = {
      log = {
        level = "debug";
      };

      inbounds = [
        {
          type = "tun";
          interface_name = "tun0";
          domain_strategy = "ipv4_only";
          inet4_address = "172.16.250.1/30";
          auto_route = false;
          strict_route = false;
          sniff = true;
        }
      ];

      outbounds = [
        {
          type = "vless";
          server = {_secret = config.sops.secrets."vless/address".path;};
          server_port = {_secret = config.sops.secrets."vless/port".path;};
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
        auto_detect_interface = true;
      };
    };
  };
}
