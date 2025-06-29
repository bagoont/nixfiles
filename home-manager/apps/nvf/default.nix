{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./binds.nix
    ./completion.nix
    ./languages.nix
    ./picker.nix
    ./theme.nix
  ];
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = false;
      enableLuaLoader = true;
      statusline.lualine.enable = true;
      filetree.neo-tree.enable = true;
      tabline.nvimBufferline.enable = true;
      dashboard.alpha.enable = true;
      terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
      };
      lazy.plugins = {
        "vim-sleuth" = {
          package = pkgs.vimPlugins.vim-sleuth;
        };
      };
    };
  };
}
