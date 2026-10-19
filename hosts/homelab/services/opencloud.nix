{
  config,
  pkgs,
  ...
}: {
  sops.secrets = {
    "opencloud/environment" = {
      sopsFile = ../../../secrets/opencloud.yaml;
    };
  };

  networking.firewall.allowedTCPPorts = [9200];

  services = {
    opencloud = {
      enable = true;
      package = pkgs.opencloud;
      url = "https://cloud.bagoont.ru";
      port = 9200;
      settings = {
        csp = {
          directives = {
            child-src = ["'self'"];
            connect-src = [
              "'self'"
              "blob:"
              "https://auth.bagoont.ru"
              "https://cloud.bagoont.ru"
              "https://raw.githubusercontent.com/opencloud-eu/awesome-apps/"
              "https://update.opencloud.eu/"
            ];
            default-src = ["'none'"];
            font-src = ["'self'"];
            frame-ancestors = ["'self'"];
            frame-src = [
              "'self'"
              "blob:"
              "https://docs.opencloud.eu"
              "https://auth.bagoont.ru"
            ];
            img-src = [
              "'self'"
              "data:"
              "blob:"
              "https://raw.githubusercontent.com/opencloud-eu/awesome-apps/"
            ];
            manifest-src = ["'self'"];
            media-src = ["'self'"];
            object-src = [
              "'self'"
              "blob:"
            ];
            script-src = [
              "'self'"
              "'unsafe-inline'"
              "https://auth.bagoont.ru"
            ];
            style-src = [
              "'self'"
              "'unsafe-inline'"
            ];
            worker-src = [
              "'self'"
              "blob:"
            ];
          };
        };
        proxy = {
          role_assignment = {
            driver = "oidc";
            oidc_role_mapper = {
              role_claim = "groups";
              role_mapping = [
                {
                  role_name = "admin";
                  claim_value = "admin";
                }
              ];
            };
          };
        };
      };
      environmentFile = config.sops.secrets."opencloud/environment".path;
      environment = {
        OC_LOG_LEVEL = "info";
        OC_INSECURE = "true";
        PROXY_TLS = "false";
        FRONTEND_ARCHIVER_MAX_SIZE = "10000000000";
        FRONTEND_CHECK_FOR_UPDATES = "true";
        IDM_CREATE_DEMO_USERS = "false";
      };
    };
  };
}
