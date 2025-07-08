{
  lib,
  pkgs,
  ...
}: {
  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;
    style = builtins.readFile (./. + "/style-dark.css");
    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      cssPriority = "user";
      control-center-margin-top = 22;
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;
      notification-icon-size = 64;
      notification-body-image-height = 128;
      notification-body-image-width = 200;
      timeout = 6;
      timeout-low = 3;
      timeout-critical = 0;
      fit-to-screen = false;
      control-center-width = 400;
      control-center-height = 915;
      notification-window-width = 375;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "title"
        "dnd"
        "volume"
        "mpris"
        "notifications"
        "buttons-grid"
      ];
      widget-config = {
        title = {
          text = "Уведомления";
          clear-all-button = true;
          button-text = "";
        };
        volume = {
          label = "";
          expand-button-label = "";
          collapse-button-label = "";
          show-per-app = true;
          show-per-app-icon = true;
          show-per-app-label = true;
        };
        dnd = {
          text = " Не беспокить";
        };
        mpris = {
          image-size = 96;
          image-radius = 4;
        };

        "buttons-grid" = {
          actions = let
            sh = cmd: "sh -c '${cmd}'";
          in [
            {
              label = "󱎫";
              type = "action";
              command = sh "${lib.getExe pkgs.gnome-solanum}";
            }
            {
              label = "󰃠";
              type = "toggle";
              active = true;
              command = sh "${pkgs.systemd}/bin/systemctl --user is-active --quiet gammastep.service && ${pkgs.systemd}/bin/systemctl --user stop gammastep.service || ${pkgs.systemd}/bin/systemctl --user start gammastep.service";
            }
            {
              label = "";
              type = "toggle";
              active = true;
              command = sh "rfkill toggle bluetooth";
            }
            {
              label = "";
              type = "toggle";
              command = sh "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            }
            {
              label = "";
              active = true;
              type = "toggle";
              command = sh "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            }
            # TODO: Toggle sing-box.
            {
              label = "󰯄";
              active = true;
              type = "toggle";
              command = "${pkgs.systemd}/bin/systemctl is-active --quiet sing-box.service && ${pkgs.systemd}/bin/systemctl stop sing-box.service || ${pkgs.systemd}/bin/systemctl start sing-box.service";
            }
          ];
        };
      };
    };
  };
}
