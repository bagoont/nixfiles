{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    brightnessctl
    catppuccin-cursors.mochaDark
    catppuccin-cursors.latteLight
  ];

  wayland.windowManager.niri = {
    enable = true;
    package = pkgs.niri;
    xwaylandSatellitePackage = pkgs.xwayland-satellite;

    settings = {
      hotkey-overlay.skip-at-startup = {};
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      prefer-no-csd = {};

      cursor.xcursor-size = config.home.pointerCursor.size;
      cursor.xcursor-theme = config.home.pointerCursor.name;

      overview = {
        backdrop-color = "#313244";
      };

      input = {
        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:caps_toggle";
        };
      };

      environment = {
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qt6ct"; # noctalia Qt template targets qt6ct (Qt5 apps keep their own qt5ct config)
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        NIXOS_OZONE_WL = "1";
        MOZ_USE_XINPUT2 = "1";
        DISPLAY = ":0";
      };

      layout = {
        gaps = 16;
        struts.left = 64;
        struts.right = 64;
        always-center-single-column = {};
        shadow.on = {};
      };

      _children = [
        {
          window-rule._children = [
            {geometry-corner-radius = 12.0;}
            {clip-to-geometry = true;}
          ];
        }
        {
          window-rule._children = [
            {
              match._props = {is-floating = true;};
            }
            {geometry-corner-radius = 10.0;}
            {clip-to-geometry = true;}
          ];
        }
        {
          window-rule._children = [
            {open-maximized = true;}
          ];
        }
        {
          window-rule._children = [
            {
              match._props = {app-id = "com.mitchellh.ghostty";};
            }
            {
              default-column-width = {proportion = 0.70;};
            }
            {open-maximized = false;}
          ];
        }
        {
          window-rule._children = [
            {
              match._props = {app-id = "org.telegram.desktop";};
            }
            {block-out-from = "screencast";}
          ];
        }
      ];
    };
  };
}
