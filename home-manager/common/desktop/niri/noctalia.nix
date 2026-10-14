{config, ...}: {
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      bar.default = {
        center = [
          "clock"
          "text_2"
          "media"
        ];
        concave_edge_corners = false;
        end = [
          "group:g3"
          "group:g1"
          "group:g2"
          "group:g4"
          "battery"
          "session"
        ];
        font_family = "Inter";
        margin_edge = 8;
        scale = 1.0500000081956387;
        start = [
          "launcher"
          "spacer_2"
          "workspaces"
          "spacer_2"
          "active_window"
        ];
        capsule_group = [
          {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "g1";
            members = [
              "cpu"
              "ram"
              "nix-monitor"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "g2";
            members = [
              "network"
              "bluetooth"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "g3";
            members = [
              "widget"
              "notifications"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "g4";
            members = [
              "brightness"
              "volume"
              "tray"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
        ];
      };

      calendar = {};

      control_center.calendar.show_events_card = false;

      desktop_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = {};
      };

      location.auto_locate = true;

      lockscreen = {
        blurred_desktop = true;
        fingerprint = false;
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = ["lockscreen-login-box@eDP-1"];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget."lockscreen-login-box@eDP-1" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 960.0;
          cy = 898.0;
          output = "eDP-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
      };

      plugin_settings."noctalia/bitwarden".server_url = "https://pass.bagoont.ru";
      plugin_settings."thepunkoff/pomodoro" = {
        long-break-duration = 30;
        sessions-before-long-break = 3;
        short-break-duration = 10;
        work-duration = 40;
      };

      plugins.enabled = [
        "noctalia/bitwarden"
        "thepunkoff/pomodoro"
        "avivbintangaringga/nix-monitor"
      ];

      shell = {
        font_family = "Inter";
        niri_overview_type_to_launch_enabled = true;
        polkit_agent = true;
        greeter_sync.auto_sync = true;
        screenshot = {
          confirm_region = true;
          remember_last_region = true;
        };
      };

      theme = {
        mode = "auto";
        source = "wallpaper";
        wallpaper_scheme = "m3-rainbow";
        templates = {
          builtin_ids = [
            "btop"
            "gtk3"
            "gtk4"
            "ghostty"
            "niri"
            "qt"
            "starship"
          ];
          community_ids = [
            "pi-agent"
            "zen-browser"
            "telegram"
            "gimp"
            "libreoffice"
            "neovim"
            "papirus-icons"
            "lazygit"
            "yazi"
          ];
          user.nvim_base16 = {
            input_path = "~/.config/noctalia/nvim-base16-template.lua";
            output_path = "~/.local/share/noctalia/matugen.lua";
            post_hook = "pkill -SIGUSR1 nvim";
          };
        };
      };

      wallpaper = {
        directory = "${config.home.homeDirectory}/Pictures/Wallpapers";
        directory_dark = "${config.home.homeDirectory}/Pictures/Wallpapers/DarkWallpapers";
        directory_light = "${config.home.homeDirectory}/Pictures/Wallpapers/LightWallpapers";
        automation.enabled = true;
        default.path = "${config.home.homeDirectory}/Pictures/Wallpapers/DarkWallpapers/a_music_stand_with_a_book_on_it.jpg";
        last.path = "${config.home.homeDirectory}/Pictures/Wallpapers/DarkWallpapers/a_music_stand_with_a_book_on_it.jpg";
        monitors."eDP-1".path = "${config.home.homeDirectory}/Pictures/Wallpapers/DarkWallpapers/a_music_stand_with_a_book_on_it.jpg";
      };

      widget = {
        spacer_2.type = "spacer";
        spacer_3.type = "spacer";
        text_2 = {
          text = "|";
          type = "text";
        };
        widget.type = "thepunkoff/pomodoro:widget";
      };
    };
  };
}
