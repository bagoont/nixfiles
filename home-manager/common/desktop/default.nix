{pkgs, ...}: {
  imports = [
    ./qt.nix
  ];

  home.packages = with pkgs; [
    dconf
    adw-gtk3
    kdePackages.qt6ct

    inter
    dejavu_fonts
    source-serif
    corefonts
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    noto-fonts-color-emoji
  ];

  home.pointerCursor = {
    enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 16;
    gtk.enable = true;
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["Fira Mono" "DejaVu Sans Mono"];
      sansSerif = ["Inter" "DejaVu Sans"];
      serif = ["Source Serif 4" "DejaVu Serif"];
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
