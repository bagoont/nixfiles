{pkgs, ...}: {
  home.packages = with pkgs; [grc];

  programs.fish = {
    enable = true;

    plugins = with pkgs.fishPlugins; [
      {
        name = "grc";
        src = grc.src;
      }
      {
        name = "autopair";
        src = autopair.src;
      }
      {
        name = "fish.fzf";
        src = fzf-fish.src;
      }
      {
        name = "sponge";
        src = sponge.src;
      }
    ];

    shellAbbrs = {
      sshon = "sudo systemctl start sshd.service";
      sshoff = "sudo systemctl stop sshd.service";
      tar = "tar -cf";
      untar = "tar -xvf";
    };

    interactiveShellInit = ''
      set fish_greeting
      fish_config theme choose "Catppuccin-Mocha"
    '';
  };

  xdg.configFile = {
    "fish/themes/Catppuccin-Latte.theme".source = pkgs.fetchurl {
      name = "Catppuccin-Latte.theme";
      url = "https://raw.githubusercontent.com/catppuccin/fish/a3b9eb5eaf2171ba1359fe98f20d226c016568cf/themes/Catppuccin%20Latte.theme";
      hash = "sha256-JV/IP87u11NgLtfsXaNciewCDDqWtFArHlixLOG0l7E=";
    };
    "fish/themes/Catppuccin-Mocha.theme".source = pkgs.fetchurl {
      name = "Catppuccin-Mocha.theme";
      url = "https://raw.githubusercontent.com/catppuccin/fish/a3b9eb5eaf2171ba1359fe98f20d226c016568cf/themes/Catppuccin%20Mocha.theme";
      hash = "sha256-kdA9Vh23nz9FW2rfOys9JVmj9rtr7n8lZUPK8cf7pGE=";
    };
  };
}
