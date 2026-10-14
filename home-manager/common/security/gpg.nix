{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [gcr_4];

  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;
    settings = {
      trust-model = "tofu+pgp";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableNushellIntegration = config.programs.nushell.enable;
    enableExtraSocket = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };

  systemd.user.services = {
    link-gnupg-socket = {
      Unit = {
        Description = "link gnupg sockets from /run to /home";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.coreutils}/bin/ln -Tfs /run/user/%U/gnupg %h/.gnupg-sockets";
        ExecStop = "${pkgs.coreutils}/bin/rm $HOME/.gnupg-sockets";
        RemainAfterExit = true;
      };
      Install.WantedBy = ["default.target"];
    };
  };
}
