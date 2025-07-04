{
  inputs,
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
    ../apps/ghostty
    ../apps/git
    ../apps/gpg
    ../apps/imv
    ../apps/mpv
    ../apps/nvf
    ../apps/office
    ../apps/ollama
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

  programs.zed-editor = {
    userSettings = {
      language_models.ollama = {
        api_url = "http://127.0.0.1:11434";
        avaliable_models = [
          {
            name = "gemma3n:latest";
            display_name = "Gemma3n";
            max_tokens = 2048;
            supports_tools = true;
          }
        ];
      };
    };
  };

  programs.nvf.settings.vim.assistant.avante-nvim = {
    enable = true;
    setupOpts = {
      providers = {
        ollama = {
          endpoint = "http://127.0.0.1:11434";
          model = "gemma3n:latest";
          timeout = 30000;
          extra_request_body = {
            options = {
              temperature = 0.75;
              num_ctx = 2048;
              keep_alive = "5m";
            };
          };
        };
      };
      behaviour = {
        auto_suggestions = false;
        auto_set_highlight_group = true;
        auto_set_keymaps = true;
        auto_apply_diff_after_generation = false;
        support_paste_from_clipboard = true;
      };
    };
  };

  programs.niri = {
    settings.outputs."DP-1".mode = {
      width = 1920;
      height = 1080;
      refresh = 144.0;
    };
  };

  programs.git = {
    userEmail = "bagoont@bagoont.ru";
    userName = "Vladislav Baginsky";
    signing = {
      key = "D17AE4329F38AFA355B8C0692CEBD2E41671AFF7";
      signByDefault = true;
    };
  };

  services.ollama.environmentVariables = {
    HCC_AMDGPU_TARGET = "gfx1032";
    HSA_OVERRIDE_GFX_VERSION = "10.3.0";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
