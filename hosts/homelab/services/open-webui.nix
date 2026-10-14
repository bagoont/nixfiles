{config, ...}: let
  HOST = "127.0.0.1";
  PORT = 9090;
  CERT_DIR = "/var/lib/ssl";
in {
  sops.secrets."open-webui" = {
    sopsFile = ../../../secrets/open-webui.yaml;
  };

  services.nginx.virtualHosts."ai.internal" = {
    forceSSL = true;
    sslCertificate = "${CERT_DIR}/internal.crt";
    sslCertificateKey = "${CERT_DIR}/internal.key";
    locations."/" = {
      proxyWebsockets = true;
      proxyPass = "http://${HOST}:${toString PORT}";
    };
  };

  virtualisation.oci-containers.containers."open-webui" = {
    image = "ghcr.io/open-webui/open-webui:main";
    ports = ["${HOST}:${toString PORT}:8080"];
    environment = {
      "ENABLE_OLLAMA_API" = "False";
      "ANONYMIZED_TELEMETRY" = "False";
      "DO_NOT_TRACK" = "True";
      "SCARF_NO_ANALYTICS" = "True";
    };
    environmentFiles = [
      config.sops.secrets."open-webui".path
    ];
    volumes = [
      "/var/lib/open-webui:/app/backend/data"
    ];
  };
}
