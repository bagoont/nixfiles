{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./languages.nix
    ./keymaps.nix
    ./lazy.nix
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      extraPackages = with pkgs; [nodejs];
      clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers.wl-copy.enable = true;
      };
      autocmds = [
        {
          event = ["FileType"];
          pattern = ["html" "nix" "yaml" "javascript" "css"];
          command = "setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2";
        }
        {
          event = ["FileType"];
          pattern = ["python" "rust" "c" "cpp" "java"];
          command = "setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4";
        }
      ];
      viAlias = false;
      vimAlias = false;
      enableLuaLoader = true;
      telescope.enable = true;
      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;
      autopairs.nvim-autopairs.enable = true;
      binds.whichKey.enable = true;
      ui = {
        illuminate.enable = true;
        fastaction.enable = true;
        colorizer.enable = true;
      };
      visuals = {
        nvim-web-devicons.enable = true;
        rainbow-delimiters.enable = true;
      };
      git = {
        gitsigns.enable = true;
      };
      utility = {
        yazi-nvim.enable = true;
        smart-splits.enable = true;
      };
    };
  };
}
