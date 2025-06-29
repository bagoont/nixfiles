{
  lib,
  pkgs,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "toml"
      "env"
      "make"
      "dockerfile"
      "docker-compose"
      "catppuccin"
      "catppuccin-icons"
      "python-zed-snippets"
    ];
    userSettings = {
      theme = "Catppuccin Mocha";
      buffer_font_family = "CaskaydiaCove NF";
      ui_font_family = "Inter";
      hour_format = "hour24";
      autosave = "on_window_change";
      restore_on_startup = "last_workspace";
      auto_update = false;
      vim_mode = true;
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
      language_models.ollama = {
        api_url = "http://192.168.0.101:11434";
        avaliable_models = [
          {
            name = "qwen3:4b";
            display_name = "Qwen3";
            max_tokens = 32768;
            supports_tools = true;
          }
          {
            name = "deepseek-r1:7b";
            display_name = "DeepSeek";
            max_tokens = 32768;
            supports_tools = true;
          }
        ];
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
        pyright = {
          diagnosticMode = "workspace";
          typeCheckingMode = "basic";
          binary = {
            path = "${pkgs.basedpyright}/bin/basedpyright-langserver";
            arguments = ["--stdio"];
          };
          python = {
            pythonPath = ".venv/bin/python";
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
          language_servers = ["pyright" "ruff"];
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
