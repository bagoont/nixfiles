{pkgs, ...}: {
  programs.nvf.settings.vim = {
    lsp.enable = true;
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      nix = {
        enable = true;
        format.type = ["alejandra"];
        lsp.servers = ["nil"];
      };
      go = {
        enable = true;
        format.type = ["gofumpt"];
        lsp.servers = ["gopls"];
      };
      python = {
        enable = true;
        format.type = ["ruff"];
        lsp.servers = ["ty"];
      };
      html.enable = true;
      css.enable = true;
      typescript = {
        enable = true;
        format.type = ["prettier"];
      };
    };

    lsp = {
      formatOnSave = true;
      trouble.enable = true;
      lspSignature.enable = true;
    };

    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        yaml
      ];
    };
  };
}
