{
  outputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./email.nix

    ../apps/sops
    ../apps/bitwarden
    ../apps/btop
    ../apps/cli
    ../apps/compression
    ../apps/desktop
    ../apps/development
    ../apps/firefox
    ../apps/fonts
    ../apps/games/minecraft.nix
    ../apps/ghostty
    ../apps/git
    ../apps/gpg
    ../apps/imv
    ../apps/mpv
    ../apps/nvf
    ../apps/office
    ../apps/overskride
    ../apps/pavucontrol
    ../apps/podman
    ../apps/rnoise
    ../apps/shell
    ../apps/syncthing
    ../apps/telegram
    ../apps/thunderbird
    ../apps/transmission
    ../apps/yazi
    ../apps/zathura
    ../apps/zed
    ../apps/zotero
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "bagoont";
    homeDirectory = "/home/bagoont";
    sessionVariables = {
      EDITOR = lib.mkDefault "nvim";
    };
  };

  programs.niri = {
    settings = {
      input = {
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          accel-profile = "adaptive";
        };
      };
    };
  };

  programs.waybar.settings.mainBar = {
    modules-right = lib.mkForce [
      "group/network-modules"
      "group/wireplumber-modules"
      "group/backlight-modules"
      "group/battery-modules"
      "tray"
      "custom/notifications"
      "group/powermenu"
    ];
  };

  programs.hyprlock.settings.label = [
    {
      monitor = "";
      text = let
        info = pkgs.writeShellScript "info" ''
          #!/bin/bash

          # Get the current battery percentage
          battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

          # Get the battery status (Charging or Discharging)
          battery_status=$(cat /sys/class/power_supply/BAT0/status)

          # Define the battery icons for each 10% segment
          battery_icons=("󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹")

          # Define specific icons
          full_icon="󰂄"
          charging_icon=""

          # Calculate the index for the icon array
          icon_index=$((battery_percentage / 10))

          # Get the corresponding icon
          battery_icon=''${battery_icons[icon_index]}

          # Check if the battery status
          if [ "$battery_status" = "Charging" ]; then
          battery_icon="$charging_icon"
          elif [ "$battery_status" == "Full" ]; then
            battery_icon="$full_icon"
          fi

          # Output the battery percentage and icon
          echo "$battery_percentage% $battery_icon"
        '';
      in ''cmd[update:1000] echo -e $(${info})'';
      color = "rgb(cdd6f4)";
      font_size = 12;
      font_family = "FiraMono";
      position = "-20, -510";
      halign = "right";
      valign = "center";
    }
  ];

  programs.git = {
    userEmail = "bagoont@bagoont.ru";
    userName = "Vladislav Baginsky";
    signing = {
      key = "D17AE4329F38AFA355B8C0692CEBD2E41671AFF7";
      signByDefault = true;
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
