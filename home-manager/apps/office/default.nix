{pkgs, ...}: {
  home.packages = with pkgs; [
    pomodoro-gtk
    libreoffice-fresh
  ];
}
