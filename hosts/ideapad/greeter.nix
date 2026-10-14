{pkgs, ...}: {
  programs.niri.enable = true;
  services.displayManager = {
    defaultSession = "niri";
    noctalia-greeter = {
      enable = true;
      passwordlessSyncUsers = ["bagoont"];
      cursorTheme = {
        package = pkgs.catppuccin-cursors.mochaDark;
        name = "catppuccin-mocha-dark-cursors";
      };
      settings = {
        keyboard = {
          layout = "us,ru";
        };
      };
    };
  };
}
