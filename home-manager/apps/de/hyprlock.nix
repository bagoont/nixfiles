{
  pkgs,
  lib,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 0;
        ignore_empty_input = true;
      };

      background = [
        {
          monitor = "";
          path = builtins.fetchurl {
            url = "https://i.redd.it/r2foidq9e4zb1.png";
            sha256 = "0y2f1r6w6lkv1dhrzc78hyc1rr9lq8bxf5aibwnzacpd137ypb86";
          };
          blur_passes = 1;
          blur_size = 7;
          noise = "1.17e-2";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 60";
          outline_thickness = 0;
          outer_color = "rgb(45475a)";
          inner_color = "rgb(1e1e2e)";
          font_color = "rgb(cdd6f4)";
          fail_color = "rgb(f38ba8)";
          check_color = "rgb(f9e2af)";
          dots_size = 0.1;
          dots_spacing = 1;
          dots_center = true;
          fade_on_empty = false;
          font_family = "CaskaydiaMono NF";
          placeholder_text = ''<span foreground="##cdd6f4">  $USER</span>'';
          hide_input = false;
          position = "0, -250";
          halign = "center";
          valign = "center";
          zindex = 10;
        }
      ];

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%I")</span>"'';
          color = "rgb(cdd6f4)";
          shadow_size = 3;
          shadow_color = "rgb(0,0,0)";
          shadow_boost = 1.2;
          font_size = 250;
          font_family = "Inter Bold";
          position = "-80, 290";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%M")</span>"'';
          color = "rgb(89b4fa)";
          font_size = 250;
          font_family = "Inter Bold";
          position = "00, 80";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%d %B, %a.")"'';
          color = "rgb(cdd6f4)";
          font_size = 22;
          font_family = "CaskaydiaMono NF ExtraBold";
          position = "0, -90";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(${lib.getExe pkgs.playerctl} metadata --format "{{title}} 󰎆  {{artist}}")"'';
          color = "rgb(89b4fa)";
          font_size = 18;
          font_family = "CaskaydiaMono NF";
          position = "0, 20";
          halign = "center";
          valign = "bottom";
        }
        #{
        #  monitor = "";
        #  text = let
        #    info = pkgs.writeShellScript "info" ''
        #           #!/bin/bash
        #
        #           # Get the current battery percentage
        #           battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
        #
        #           # Get the battery status (Charging or Discharging)
        #           battery_status=$(cat /sys/class/power_supply/BAT0/status)
        #
        #           # Define the battery icons for each 10% segment
        #           battery_icons=("󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹")
        #
        #           # Define specific icons
        #           full_icon="󰂄"
        #           charging_icon=""
        #
        #           # Calculate the index for the icon array
        #           icon_index=$((battery_percentage / 10))
        #
        #           # Get the corresponding icon
        #           battery_icon=''${battery_icons[icon_index]}
        #
        #           # Check if the battery status
        #           if [ "$battery_status" = "Charging" ]; then
        #      battery_icon="$charging_icon"
        #           elif [ "$battery_status" == "Full" ]; then
        #             battery_icon="$full_icon"
        #           fi
        #
        #           # Output the battery percentage and icon
        #           echo "$battery_percentage% $battery_icon"
        #    '';
        #  in ''cmd[update:1000] echo -e $(${info})'';
        #  color = "rgb(cdd6f4)";
        #  font_size = 12;
        #  font_family = "JetBrains NFM ExtraBold";
        #  position = "-20, -510";
        #  halign = "right";
        #  valign = "center";
        #}
      ];
    };
  };
}
