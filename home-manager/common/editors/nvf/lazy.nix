{pkgs, ...}: let
  pi-nvim-pkg =
    (pkgs.vimUtils.buildVimPlugin {
      pname = "pi-nvim";
      version = "main";
      src = pkgs.fetchFromGitHub {
        owner = "carderne";
        repo = "pi-nvim";
        rev = "fbc6f12652234f03d2fe729adbcc3ff61ca7d39a";
        hash = "sha256-yJzhyABIWltle7DJlSUXLAAZ0BFzZuzr/qW0sqHVzZc=";
      };
    }).overrideAttrs (old: {
      name = "pi-nvim";
    });
  base46-pkg =
    (pkgs.vimUtils.buildVimPlugin {
      pname = "base46";
      version = "main";
      src = pkgs.fetchFromGitHub {
        owner = "AvengeMedia";
        repo = "base46";
        rev = "cb8a1257bbc2640f6e7415a01219b34d3efd1494";
        hash = "sha256-6kK8q2dmmW3RO9FQmlcYN6Yyhl6fXE5ey1l8PWRVCfc=";
      };
    }).overrideAttrs (old: {
      name = "base46";
      doCheck = false;
    });
in {
  programs.nvf.settings.vim = {
    lazy = {
      enable = true;
      plugins = {
        "pi-nvim" = {
          package = pi-nvim-pkg;
          setupModule = "pi-nvim";
          setupOpts = {
            set_default_keymaps = false;
          };
        };
        "base46" = {
          package = base46-pkg;
          setupModule = "base46";
          setupOpts = {};
        };
      };
    };
  };
}
