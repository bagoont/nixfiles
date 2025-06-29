{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri

    ./binds.nix
    ./startup.nix
  ];

  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];

  home.packages = with pkgs; [
    wl-clipboard
    brightnessctl
    catppuccin-cursors.mochaDark
    catppuccin-cursors.latteLight
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      hotkey-overlay.skip-at-startup = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      prefer-no-csd = true;

      cursor.size = config.home.pointerCursor.size;
      cursor.theme = config.home.pointerCursor.name;

      overview = {
        backdrop-color = "#313244";
      };

      input = {
        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:caps_toggle";
        };
        # touchpad = {
        #   click-method = "button-areas";
        #   dwt = true;
        #   dwtp = true;
        #   natural-scroll = true;
        #   scroll-method = "two-finger";
        #   tap = true;
        #   tap-button-map = "left-right-middle";
        #   accel-profile = "adaptive";
        # };
      };

      environment = {
        NIXOS_OZONE_WL = "1";
        MOZ_USE_XINPUT2 = "1";
        DISPLAY = ":0";
      };

      layout = {
        background-color = "rgb(49, 50, 68)";
        gaps = 16;
        struts.left = 64;
        struts.right = 64;
        always-center-single-column = true;
        shadow.enable = true;

        tab-indicator = {
          position = "top";
          gaps-between-tabs = 10;

          # hide-when-single-tab = true;
          # place-within-column = true;

          # active.color = "red";
        };

        focus-ring = {
          enable = true;
          width = 3;
          active = {
            gradient = {
              from = "#89b4fa";
              to = "#cdd6f4";
              angle = 45;
              in' = "oklch shorter hue";
            };
          };
        };
      };

      switch-events = with config.lib.niri.actions; let
        sh = spawn "sh" "-c";
      in {
        tablet-mode-on.action = sh "notify-send tablet-mode-on";
        tablet-mode-off.action = sh "notify-send tablet-mode-off";
      };

      window-rules = [
        (let
          allCorners = r: {
            bottom-left = r;
            bottom-right = r;
            top-left = r;
            top-right = r;
          };
        in {
          matches = [{is-floating = true;}];
          geometry-corner-radius = allCorners 10.0;
          clip-to-geometry = true;
        })
        {
          open-maximized = true;
        }
        {
          matches = [{app-id = "com.mitchellh.ghostty";}];
          open-maximized = false;
        }
        {
          matches = [{app-id = "io.github.kaii_lb.Overskride";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "org.gnome.Solanum";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "org.pulseaudio.pavucontrol";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "Bitwarden";}];
          open-floating = true;
          block-out-from = "screen-capture";
          default-column-width.fixed = 750;
          default-window-height.fixed = 750;
        }
        {
          matches = [{app-id = "nm-connection-editor";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "org.telegram.desktop";}];
          block-out-from = "screencast";
        }
        {
          matches = [{is-active = false;}];
          opacity = 0.95;
        }
      ];

      layer-rules = [
        {
          matches = [{namespace = "^swaync-notification-window$";}];
          block-out-from = "screencast";
        }
      ];
    };
  };
}
