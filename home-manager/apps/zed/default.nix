{
  lib,
  pkgs,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "catppuccin"
      "catppuccin-icons"
      "csv"
      "docker-compose"
      "dockerfile"
      "env"
      "git-firefly"
      "html"
      "nginx"
      "nix"
      "sql"
      "toml"
      "ty"
    ];
    userSettings = {
      theme = "Catppuccin Mocha";
      buffer_font_family = "FiraCode Nerd Font";
      buffer_font_size = 12;
      ui_font_family = "Inter";
      hour_format = "hour24";
      autosave = "on_window_change";
      restore_on_startup = "last_workspace";
      auto_update = false;
      vim_mode = false;
      show_whitespaces = "all";
      centered_layout = {
        left_padding = 0.15;
        right_padding = 0.15;
      };
      icon_theme = {
        mode = "dark";
        dark = "Catppuccin Mocha";
        light = "Catppuccin Latte";
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };

      lsp = {
        nil = {
          binary.path = lib.getExe pkgs.nil;
          settings.diagnostics.ignored = ["unused_binding"];
          initialization_options.formatting.command = ["${lib.getExe pkgs.alejandra}" "--quiet" "--"];
        };
        ty = {
          binary = {
            path = lib.getExe pkgs.ty;
            arguments = ["server"];
          };
        };
        ruff = {
          binary = {
            path = lib.getExe pkgs.ruff;
            arguments = ["server"];
          };
        };
        yaml-language-server = {
          settings = {
            yaml = {
              format.singleQuote = true;
            };
          };
        };
      };

      languages = {
        "Nix" = {
          language_servers = ["nil"];
        };
        "Python" = {
          language_servers = ["ty" "ruff"];
          format_on_save = "on";
          formatter = [
            {
              code_actions = {
                "source.organizeImports.ruff" = true;
                "source.fixAll.ruff" = true;
              };
            }
            {
              language_server.name = "ruff";
            }
          ];
        };
        "YAML" = {
          tab_size = 2;
          format_on_save = "on";
          formatter = "language_server";
        };
      };
    };
  };
}
