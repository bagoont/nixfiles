{config, ...}: {
  sops.secrets."logseq-sync/token" = {
    sopsFile = ../../../secrets/logseq-sync.yaml;
  };

  sops.templates."logseq-sync.env".content = ''
    DB_SYNC_ADMIN_TOKEN=${config.sops.placeholder."logseq-sync/token"}
  '';

  users.users.logseq-sync = {
    isSystemUser = true;
    createHome = false;
    group = "logseq-sync";
  };

  systemd.tmpfiles.rules = ["d /var/lib/logseq-sync 0700 logseq-sync logseq-sync -"];

  virtualisation.oci-containers.containers.logseq-sync = {
    image = "ghcr.io/yshalsager/logseq-selfhost-sync:latest";
    user = "${toString config.users.users.logseq-sync.uid}:${toString config.users.groups.logseq-sync.gid}";
    ports = ["8787:8787"];
    volumes = ["/var/lib/logseq-sync:/app/data"];
    environment = {
      DB_SYNC_PORT = "8787";
      DB_SYNC_BASE_URL = "https://logseq.bagoont.ru";
      DB_SYNC_DATA_DIR = "/app/data";
      DB_SYNC_STORAGE_DRIVER = "sqlite";
      DB_SYNC_ASSETS_DRIVER = "filesystem";
      DB_SYNC_LOG_LEVEL = "info";
      COGNITO_ISSUER = "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_dtagLnju8";
      COGNITO_CLIENT_ID = "69cs1lgme7p8kbgld8n5kseii6";
      COGNITO_JWKS_URL = "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_dtagLnju8/.well-known/jwks.json";
    };
    environmentFiles = [config.sops.templates."logseq-sync.env".path];
    extraOptions = [
      "--read-only"
      "--tmpfs=/tmp:rw,noexec,nosuid,nodev"
      "--cap-drop=ALL"
      "--security-opt=no-new-privileges:true"
    ];
  };
}
