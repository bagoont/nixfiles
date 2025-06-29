{pkgs, ...}: {
  programs.nvf.settings.vim = {
    telescope.enable = true;
    lazy.plugins = {
      "telescope-fzf-native.nvim" = {
        package = pkgs.vimPlugins.telescope-fzf-native-nvim;
      };
    };
  };
}
