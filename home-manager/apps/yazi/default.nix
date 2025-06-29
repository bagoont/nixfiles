{
  config,
  pkgs,
  ...
}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = config.programs.fish.enable;

    plugins = with pkgs; {
      "full-border" = yaziPlugins.full-border;
    };

    settings = {
      mgr = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;

        prepend_keymap = [
          {
            run = ''shell '${pkgs.ripdrag} "$@" -x 2>/dev/null &' --confirm'';
            on = ["n"];
          }
        ];
      };

      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 600;
        max_height = 900;
        cache_dir = config.xdg.cacheHome;
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
      };
    };
  };
}
