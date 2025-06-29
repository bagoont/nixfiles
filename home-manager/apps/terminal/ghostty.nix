{
  lib,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "catppuccin-mocha.conf";
      font-family = "CaskaydiaCove NF";
      font-size = 12;
      window-padding-x = "25";
      window-padding-y = "10";
      confirm-close-surface = false;
      quick-terminal-animation-duration = 0.08;
    };
  };

  xdg.configFile = {
    "ghostty/themes/catppuccin-latte.conf".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/ghostty/22bd8bb12b2e082fbbe125d603709ee9fa659d36/themes/catppuccin-latte.conf";
      hash = "sha256-q6oRz2lMa17Nm9dBvr0Jj524RPXl/AV4t4M5nz1JWhw=";
    };
    "ghostty/themes/catppuccin-mocha.conf".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/ghostty/22bd8bb12b2e082fbbe125d603709ee9fa659d36/themes/catppuccin-mocha.conf";
      hash = "sha256-2qCNXQkJZfRAXGQXS7v9JqXHavTBpcekxZGfVI80u6s=";
    };
  };

  xdg.desktopEntries.ghostty = {
    name = "Ghostty";
    exec = "${lib.getExe pkgs.ghostty}";
    categories = ["System" "TerminalEmulator"];
    genericName = "ghostty";
    icon = "com.mitchellh.ghostty";
    terminal = false;
    type = "Application";
  };
}
