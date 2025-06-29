{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        after_sleep_cmd = "niri msg action power-on-monitors";
        ignore_dbus_inhibit = false;
      };

      listener = [
        {
          timeout = 120;
          on-timeout = "pidof hyprlock && niri msg action power-off-monitors";
          on-resume = "pidof hyprlock && niri msg action power-on-monitors";
        }

        {
          timeout = 300;
          on-timeout = "niri msg action power-off-monitors";
          on-resume = "niri msg action power-on-monitors";
        }

        {
          timeout = 600;
          on-timeout = "hyprlock";
        }

        {
          timeout = 1200;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
