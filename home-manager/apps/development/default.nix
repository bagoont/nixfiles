{pkgs, ...}: {
  home.packages = with pkgs; [
    dbeaver-bin
    httpie-desktop
  ];
}
