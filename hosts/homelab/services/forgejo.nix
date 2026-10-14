{
  config,
  lib,
  pkgs,
  ...
}: let
  HOST = "0.0.0.0";
  PORT = 3000;
  DOMAIN = "git.bagoont.ru";
in {
  sops.secrets = {
    "forgejo/runner-token" = {
      sopsFile = ../../../secrets/forgejo.yaml;
    };
    "forgejo/password" = {
      owner = config.services.forgejo.user;
      group = config.services.forgejo.group;
      sopsFile = ../../../secrets/forgejo.yaml;
    };
    "forgejo/mailerAddress" = {
      owner = config.services.forgejo.user;
      group = config.services.forgejo.group;
      sopsFile = ../../../secrets/forgejo.yaml;
    };
    "forgejo/mailerUser" = {
      owner = config.services.forgejo.user;
      group = config.services.forgejo.group;
      sopsFile = ../../../secrets/forgejo.yaml;
    };
  };

  networking.firewall.allowedTCPPorts = [PORT];

  systemd.services.forgejo.preStart = let
    adminCmd = "${lib.getExe pkgs.forgejo} admin user";
    pwd = config.sops.secrets."forgejo/password";
    user = "bagoont";
  in ''
    ${adminCmd} create --admin --email "bagoont@bagoont.ru" --username ${user} --password "$(tr -d '\n' < ${pwd.path})" || true
    ${adminCmd} change-password --username ${user} --password "$(tr -d '\n' < ${pwd.path})" || true
  '';

  services = {
    postgresql = {
      ensureDatabases = ["forgejo"];
      ensureUsers = [
        {
          name = "forgejo";
          ensureDBOwnership = true;
        }
      ];
    };

    forgejo = {
      enable = true;
      database = {
        type = "postgres";
        createDatabase = true;
      };
      settings = {
        server = {
          DOMAIN = DOMAIN;
          ROOT_URL = "https://${DOMAIN}";
          HTTP_ADDR = HOST;
          HTTP_PORT = PORT;
        };
        openid = {
          ENABLE_OPENID_SIGNIN = false;
          ENABLE_OPENID_SIGNUP = false;
          WHITELISTED_URIS = "auth.bagoont.ru";
        };
        service = {
          DISABLE_REGISTRATION = false;
          ALLOW_ONLY_EXTERNAL_REGISTRATION = true;
          SHOW_REGISTRATION_BUTTON = false;
        };
        mailer = {
          ENABLED = true;
          PROTOCOL = "smtp+starttls";
          SMTP_PORT = 587;
        };
      };
      secrets = {
        mailer = {
          SMTP_ADDR = config.sops.secrets."forgejo/mailerAddress".path;
          USER = config.sops.secrets."forgejo/mailerUser".path;
          PASSWD = config.sops.secrets."email/no-reply/password".path;
        };
      };
    };
    forgejo-runner = {
      package = pkgs.forgejo-runner;
      instances.default = {
        enable = true;
        runtimes.docker = true;
        settings = {
          runner.labels = [
            "ubuntu-latest:docker://node:24-bookworm"
            "ubuntu-22.04:docker://node:24-bookworm"
            "ubuntu-20.04:docker://node:24-bookworm"
          ];
          server.connections.default = {
            url = "https://${DOMAIN}";
            uuid = "9149be97-1a83-4bc8-a91f-74292fd9e9f3";
          };
        };
        secrets.server.connections.default.token_url =
          config.sops.secrets."forgejo/runner-token".path;
      };
    };
  };
}
