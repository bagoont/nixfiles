{pkgs, ...}: {
  home.packages = with pkgs; [
    inter
    dejavu_fonts
    source-serif
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    noto-fonts-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["FiraMono" "DejaVu Sans Mono"];
      sansSerif = ["Inter" "DejaVu Sans"];
      serif = ["Source Serif 4" "DejaVu Serif"];
    };
  };
}
