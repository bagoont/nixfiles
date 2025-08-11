{pkgs, ...}: {
  programs.nekoray = {
    package = pkgs.nekoray;
    enable = true;
    tunMode.enable = true;
  };
}
