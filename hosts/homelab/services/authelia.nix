{
  config,
  pkgs,
  lib,
  ...
}: let
  HOST = "0.0.0.0";
  PORT = 9091;
  TOP_LEVEL_DOMAIN = "bagoont.ru";
  DOMAIN = "auth.${TOP_LEVEL_DOMAIN}";
  PROTOCOL = "https";
in {
  sops.secrets = {
    "authelia/storageEncryptionKey" = {
      owner = config.services.authelia.instances.main.user;
      group = config.services.authelia.instances.main.group;
      sopsFile = ../../../secrets/authelia/authelia.yaml;
    };
    "authelia/jwtSecret" = {
      owner = config.services.authelia.instances.main.user;
      group = config.services.authelia.instances.main.group;
      sopsFile = ../../../secrets/authelia/authelia.yaml;
    };
    "authelia/sessionSecret" = {
      owner = config.services.authelia.instances.main.user;
      group = config.services.authelia.instances.main.group;
      sopsFile = ../../../secrets/authelia/authelia.yaml;
    };
    "authelia/oidcIssuerPrivateKey" = {
      owner = config.services.authelia.instances.main.user;
      group = config.services.authelia.instances.main.group;
      sopsFile = ../../../secrets/authelia/authelia.yaml;
    };
    "authelia/oidcHmacSecret" = {
      owner = config.services.authelia.instances.main.user;
      group = config.services.authelia.instances.main.group;
      sopsFile = ../../../secrets/authelia/authelia.yaml;
    };
    "authelia-db" = {
      owner = config.services.authelia.instances.main.user;
      group = config.services.authelia.instances.main.group;
      sopsFile = ../../../secrets/authelia/db.bin;
      format = "binary";
    };
    "authelia-smtp" = {
      owner = config.services.authelia.instances.main.user;
      group = config.services.authelia.instances.main.group;
      sopsFile = ../../../secrets/authelia/smtp.bin;
      format = "binary";
    };
    "authelia-clients" = {
      owner = config.services.authelia.instances.main.user;
      group = config.services.authelia.instances.main.group;
      sopsFile = ../../../secrets/authelia/clients.bin;
      format = "binary";
    };
  };

  networking.firewall.allowedTCPPorts = [PORT];

  services = {
    postgresql = {
      ensureDatabases = ["authelia"];
      ensureUsers = [
        {
          name = "authelia";
          ensureDBOwnership = true;
        }
      ];
    };

    redis.servers.authelia = {
      enable = true;
      user = config.services.authelia.instances.main.user;
    };

    authelia.instances.main = {
      enable = true;
      settingsFiles = [
        config.sops.secrets."authelia-smtp".path
        config.sops.secrets."authelia-clients".path
      ];
      secrets = {
        storageEncryptionKeyFile = config.sops.secrets."authelia/storageEncryptionKey".path;
        jwtSecretFile = config.sops.secrets."authelia/jwtSecret".path;
        sessionSecretFile = config.sops.secrets."authelia/sessionSecret".path;
        oidcIssuerPrivateKeyFile = config.sops.secrets."authelia/oidcIssuerPrivateKey".path;
        oidcHmacSecretFile = config.sops.secrets."authelia/oidcHmacSecret".path;
      };
      settings = {
        theme = "auto";
        default_2fa_method = "totp";
        telemetry.metrics.enabled = false;
        server.disable_healthcheck = true;
        server = {
          address = "${HOST}:${lib.toString PORT}";
          endpoints = {
            authz.forward-auth.implementation = "ForwardAuth";
          };
        };
        access_control = {
          default_policy = "one_factor";
        };
        totp = {
          issuer = DOMAIN;
          period = 30;
          skew = 1;
        };
        ntp.address = "udp://time.cloudflare.com:123";
        storage.postgres = {
          address = "unix:///run/postgresql/.s.PGSQL.5432";
          username = "authelia";
          database = "authelia";
        };
        session = {
          cookies = [
            {
              name = "authelia_session";
              domain = TOP_LEVEL_DOMAIN;
              authelia_url = "${PROTOCOL}://${DOMAIN}";
              default_redirection_url = "https://pangolin.bagoont.ru";
            }
          ];
          redis = {
            host = config.services.redis.servers.authelia.unixSocket;
            port = 0;
          };
        };
        authentication_backend.file = {
          path = config.sops.secrets."authelia-db".path;
          password = {
            algorithm = "argon2";
            argon2 = {
              variant = "argon2id";
              iterations = 3;
              memory = 65536;
              parallelism = 4;
              key_length = 32;
              salt_length = 16;
            };
          };
        };
        identity_providers = {
          oidc = {
            cors = {
              allowed_origins = "*";
              endpoints = ["authorization" "token" "revocation" "revocation" "userinfo"];
            };
            lifespans = {
              access_token = "1 hour";
              authorize_code = "1 minute";
              id_token = "1 hour";
              refresh_token = "90 minutes";
            };
          };
        };
      };
    };
  };
}
