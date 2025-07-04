{pkgs, ...}: {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 16;
    gtk.enable = true;
  };
}
