{pkgs, ...}: {
  programs.nvf.settings.vim = {
    lazy.plugins = {
      "blink.cmp" = {
        package = pkgs.vimPlugins.blink-cmp;
        event = ["BufEnter"];
        setupModule = "blink.cmp";

        setupOpts = {
          keymap = {
            preset = "super-tab";
          };

          cmdline.sources = {
            default = [
              "lsp"
              "path"
              "buffer"
            ];
          };

          completion = {
            menu = {
              auto_show = true;
            };

            documentation = {
              auto_show = true;
              auto_show_delay_ms = 500;
            };

            ghost_text.enabled = false;
          };
        };
      };
    };
  };
}
