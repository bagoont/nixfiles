{pkgs, ...}: let
  CERT_DIR = "/var/lib/ssl";
in {
  systemd = {
    tmpfiles.rules = [
      "d ${CERT_DIR} 700 nginx nginx -"
    ];

    services.generate-internal-cert = {
      description = "Generate self-signed SSL certificate";
      after = ["network.target"];
      serviceConfig = {
        Type = "oneshot";
        User = "nginx";
        Group = "nginx";
        ExecStart = pkgs.writeShellScript "generate-internal-cert" ''
          CERT_DIR=${CERT_DIR}
          CERT_FILE="$CERT_DIR/internal.crt"
          KEY_FILE="$CERT_DIR/internal.key"

          mkdir -p $CERT_DIR
          chmod 700 $CERT_DIR

          if [ ! -f "$CERT_FILE" ] || [ ! -f "$KEY_FILE" ]; then
            ${pkgs.openssl}/bin/openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
              -keyout $KEY_FILE \
              -out $CERT_FILE \
              -subj "/CN=*.internal"
              -addext "subjectAltName=DNS:*.internal,DNS:internal"

            chmod 600 $KEY_FILE
            chmod 644 $CERT_FILE

            echo "Certificate generated successfully"
          else
            echo "Certificate already exists, skipping"
          fi
        '';
      };
      wantedBy = ["multi-user.target"];
    };

    timers.generate-internal-cert = {
      description = "Timer for local certificate regeneration";
      timerConfig = {
        OnBootSec = "1min";
        OnUnitActiveSec = "365d";
        Unit = "generate-internal-cert.service";
      };
      wantedBy = ["timers.target"];
    };
  };

  services.nginx = {
    enable = true;

    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      "proxmox.internal" = {
        forceSSL = true;
        sslCertificate = "${CERT_DIR}/internal.crt";
        sslCertificateKey = "${CERT_DIR}/internal.key";
        locations."/" = {
          proxyWebsockets = true;
          proxyPass = "https://10.0.8.1:8006";
        };
      };
    };
  };
}
