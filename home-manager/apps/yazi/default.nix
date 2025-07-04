{
  config,
  pkgs,
  ...
}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = config.programs.fish.enable;

    settings = {
      mgr = {
        ratio = [
          1
          3
          4
        ];
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = false;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
        scrolloff = 5;
        mouse_events = ["click" "scroll" "drag"];
        title_format = "Yazi: {cwd}";
      };

      preview = {
        wrap = "no";
        image_filter = "lanczos3";
        image_delay = 30;
        image_quality = 75;
        tab_size = 2;
        max_width = 1200;
        max_height = 1800;
        cache_dir = config.xdg.cacheHome;
        ueberzug_scale = 1;
        ueberzug_offset = [0 0 0 0];
      };

      tasks = {
        micro_workers = 10;
        macro_workers = 25;
        bizarre_retry = 5;
        image_alloc = 536870912;
        image_bound = [0 0];
        suppress_preload = false;
      };
    };
  };
}
