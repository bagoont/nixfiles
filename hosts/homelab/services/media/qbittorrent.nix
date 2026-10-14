{pkgs, ...}: let
  HOST = "127.0.0.1";
  PORT = 8090;
  CERT_DIR = "/var/lib/ssl";
in {
  services.nginx.virtualHosts."torrent.internal" = {
    forceSSL = true;
    sslCertificate = "${CERT_DIR}/internal.crt";
    sslCertificateKey = "${CERT_DIR}/internal.key";
    locations."/" = {
      proxyWebsockets = true;
      proxyPass = "http://${HOST}:${toString PORT}";
    };
  };

  users.users."qbittorrent" = {
    isSystemUser = true;
    createHome = false;
    extraGroups = ["media"];
  };

  services.qbittorrent = {
    enable = true;
    package = pkgs.qbittorrent-nox;
    openFirewall = true;
    webuiPort = PORT;
    user = "qbittorrent";
    serverConfig = {
      BitTorrent.Session.DefaultSavePath = "/media/torrents";
      Preferences = {
        WebUI = {
          Username = "bagoont";
          Password_PBKDF2 = "Pbpz8YsQXJwCgTXpxydEVQ==:tykhx0446Uxc0cJF/BJ2rYhxL1exJFO1cdh9HN8dgVzI9+o9xnq+IWUZVjXZ8FeaUKUaLGHA7K1uvRLD0pT0ew==";
        };
        General.Locale = "ru";
      };
    };
  };
}
