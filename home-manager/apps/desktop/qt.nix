{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-mocha-blue
    '';

    "Kvantum/catppuccin-mocha-blue".source = "${pkgs.catppuccin-kvantum.override {
      accent = "blue";
      variant = "mocha";
    }}/share/Kvantum/catppuccin-mocha-blue";
  };
}
