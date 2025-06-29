{
  inputs,
  outputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops

    ./email.nix

    ../apps/sops
    ../apps/bat
    ../apps/btop
    ../apps/de
    ../apps/firefox
    ../apps/git
    ../apps/imv
    ../apps/mpv
    ../apps/nvf
    # ../apps/logseq
    ../apps/office
    ../apps/overskride
    ../apps/pavucontrol
    ../apps/syncthing
    ../apps/telegram
    ../apps/terminal
    ../apps/transmission
    ../apps/yazi
    ../apps/zathura
    ../apps/zed
    ../apps/podman
    ../apps/bitwarden
    ../apps/solanum
    ../apps/zotero
    ../apps/ollama
    ../apps/thunderbird
    # ../../apps/services/gammastep.nix
    ../apps/services/gpg.nix
    ../apps/services/rnoise.nix
    #   ../apps/services/secrets.nix
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
      MANPAGER = lib.mkDefault "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
      UV_PYTHON_DOWNLOADS = "never";
    };
    packages = with pkgs; [
      nerd-fonts.caskaydia-mono
      nerd-fonts.caskaydia-cove
      inter
      noto-fonts-emoji
    ];
    pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 16;
      gtk.enable = true;
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

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["CaskaydiaMono NF"];
      sansSerif = ["Inter"];
      serif = ["Inter"];
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };

    mimeApps = {
      enable = true;
      associations.added = {
        "x-scheme-handler/terminal" = ["ghostty.desktop"];
      };

      defaultApplications = {
        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
        "text/plain" = ["nvim.desktop"];
        "inode/directory" = ["yazi.desktop"];
        "image/jpeg" = ["imv.desktop"];
        "image/png" = ["imv.desktop"];
        "image/svg" = ["imv.desktop"];
        "image/gif" = ["imv.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/avi" = ["mpv.desktop"];
        "video/mkv" = ["mpv.desktop"];
        "text/html" = ["firefox.desktop"];
        "text/xml" = ["firefox.desktop"];
        "x-scheme-handler/mailto" = ["neomutt.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/terminal" = ["ghostty.desktop"];
        "x-scheme-handler/tg" = ["org.telegram.desktop.desktop"];
        "x-scheme-handler/tonsite" = ["org.telegram.desktop.desktop"];
      };
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
