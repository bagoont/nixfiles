{
  pkgs,
  lib,
  ...
}: {
  programs.bat = {
    enable = true;
    package = pkgs.bat;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      batman
      batpipe
      batwatch
      prettybat
    ];
    config = {
      pager = "less -FR";
      theme = "Catppuccin-mocha";
    };
    themes = let
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
        hash = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
      };
    in {
      Catppuccin-mocha = {
        inherit src;
        file = "Catppuccin-mocha.tmTheme";
      };
      Catppuccin-latte = {
        inherit src;
        file = "Catppuccin-latte.tmTheme";
      };
    };
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | ${lib.getExe pkgs.bat} -l man -p'";
    MANROFFOPT = "-c";
  };

  home.shellAliases = {
    cat = "bat --plain --color=always";
    less = "bat --pager --style=numbers --color=always";
  };
}
