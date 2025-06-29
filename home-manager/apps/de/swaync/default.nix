{
  lib,
  pkgs,
  ...
}: {
  services.swaync = {
    enable = true;
    style = builtins.readFile (./. + "/style-dark.css");
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-margin-top = 13;
      control-center-margin-bottom = 13;
      control-center-margin-right = 13;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 500;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "title"
        "dnd"
        "notifications"
        "mpris"
        "volume"
        "buttons-grid"
      ];
      widget-config = {
        title = {
          text = "Центр уведомлений";
          clear-all-button = true;
          button-text = "󰆴 Очистить";
        };
        dnd = {
          text = "Не беспокоить";
        };
        label = {
          max-lines = 1;
          text = "Центр уведомлений";
        };
        mpris = {
          image-size = 96;
          image-radius = 7;
        };
        volume = {
          label = "󰕾";
          show-per-app = true;
        };
        buttons-grid = {
          actions = [
            {
              label = "󰐥";
              command = "sh -c systemctl poweroff";
            }
            {
              label = "󰜉";
              command = "sh -c systemctl reboot";
            }
            {
              label = "󰤄";
              command = "sh -c systemctl susped";
            }
            {
              label = "󰌾";
              command = "sh -c hyprlock";
            }
            {
              label = "";
              command = "sh -c ${lib.getExe pkgs.kooha}";
            }
            {
              label = "󰂯";
              command = "sh -c ${lib.getExe pkgs.overskride}";
            }
          ];
        };
      };
    };
  };
}
