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
        format.type = "alejandra";
        lsp.server = "nil";
      };
      markdown = {
        enable = true;
        format.type = "prettierd";
        lsp.server = "marksman";
      };
      rust = {
        enable = true;
        format.type = "rustfmt";
      };
      python = {
        enable = true;
        format.type = "ruff";
        lsp.server = "basedpyright";
      };
    };

    lsp = {
      formatOnSave = true;
      trouble.enable = true;
      lspSignature.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
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
