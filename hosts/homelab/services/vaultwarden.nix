{config, ...}: let
  HOST = "0.0.0.0";
  PORT = 8222;
  DOMAIN = "pass.bagoont.ru";
  PROTOCOL = "https";
in {
  sops.secrets."vaultwarden" = {
    owner = "vaultwarden";
    group = "vaultwarden";
    sopsFile = ../../../secrets/vaultwarden.yaml;
  };

  networking.firewall.allowedTCPPorts = [PORT];

  services.vaultwarden = {
    enable = true;
    backupDir = "/var/local/vaultwarden/backup";
    environmentFile = config.sops.secrets."vaultwarden".path;
    config = {
      DOMAIN = "${PROTOCOL}://${DOMAIN}";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = HOST;
      ROCKET_PORT = PORT;
      ROCKET_LOG = "critical";
      SSO_ENABLED = true;
    };
  };
}
