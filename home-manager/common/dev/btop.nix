{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "noctalia"; # written by noctalia's btop template to ~/.config/btop/themes/noctalia.theme
      theme_background = false;
      truecolor = true;
      update_ms = 1500;
      temperature_scale = "celsius";
      show_battery = true;
      vim_keys = true;
    };
  };
}
