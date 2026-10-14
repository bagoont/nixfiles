{pkgs, ...}: {
  imports = [
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    libreoffice-qt-stable
    opencloud-desktop
    telegram-desktop
    logseq-db
    transmission_4-gtk
    pangolin-cli
    gimp
    ouch
  ];
}
