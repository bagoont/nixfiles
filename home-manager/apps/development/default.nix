{pkgs, ...}: {
  home.packages = with pkgs; [
    filezilla
    dbeaver-bin
    httpie-desktop
  ];
}
