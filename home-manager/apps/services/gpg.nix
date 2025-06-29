{pkgs, ...}: {
  home.packages = with pkgs; [gcr];

  programs.gpg = {
    enable = true;
    settings = {
      trust-model = "tofu+pgp";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableFishIntegration = true;
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
