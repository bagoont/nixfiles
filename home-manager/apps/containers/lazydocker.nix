{pkgs, ...}: {
  programs.lazydocker = {
    enable = true;
    package = pkgs.lazydocker;
  };

  home.shellAliases = {
    ld = "lazydocker";
  };
}
