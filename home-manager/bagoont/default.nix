{
  lib,
  ...
}: {
  imports = [
    ./git.nix
    ../common/security/sops.nix
  ];

  home = {
    username = "bagoont";
    homeDirectory = "/home/bagoont";
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = lib.mkDefault "nvim";
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
