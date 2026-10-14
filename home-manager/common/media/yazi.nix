{
  config,
  pkgs,
  lib,
  ...
}: let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "bb758e2fd774738f14cd260642631ebbd568741a";
    hash = "sha256-uV5KZE+4gT/o7hzer/hwAfU5lyDYgMnRlsQX+BkCRhM=";
  };
in {
  programs.yazi = {
    enable = true;
    enableNushellIntegration = config.programs.nushell.enable;
    shellWrapperName = "y";
    extraPackages = with pkgs; [ripdrag starship git];

    initLua = ''
      require("git"):setup { order = 1500 }
      require("starship"):setup()
      require("no-status"):setup()
    '';

    keymap.mgr.prepend_keymap = [
      {
        on = "l";
        run = "plugin smart-enter";
        desc = "Enter directory or open file";
      }
      {
        on = "F";
        run = "plugin smart-filter";
        desc = "Smart filter";
      }
      {
        on = "p";
        run = "plugin smart-paste";
        desc = "Paste into hovered directory or current directory";
      }
      {
        on = "f";
        run = "plugin jump-to-char";
        desc = "Jump to character";
      }
      {
        on = "<C-n>";
        run = "shell -- ${lib.getExe pkgs.ripdrag} --all --and-exit --no-click -- %s";
        desc = "Drag selected files to another application";
      }
    ];

    plugins = {
      piper = "${yazi-plugins}/piper.yazi";
      smart-enter = "${yazi-plugins}/smart-enter.yazi";
      smart-filter = "${yazi-plugins}/smart-filter.yazi";
      smart-paste = "${yazi-plugins}/smart-paste.yazi";
      mime-ext = "${yazi-plugins}/mime-ext.yazi";
      jump-to-char = "${yazi-plugins}/jump-to-char.yazi";
      git = "${yazi-plugins}/git.yazi";
      no-status = "${yazi-plugins}/no-status.yazi";
      starship = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "starship.yazi";
        rev = "159eaba5b5052bf78ff6cfbfe4e527b946818c82";
        sha256 = "sha256-I21to4cxlszRpsb58cvsmwX7VglQBSJC0rrsFIltzC8=";
      };
    };

    settings = {
      mgr = {
        ratio = [
          1
          3
          4
        ];
        sort_by = "mtime";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = false;
        linemode = "size";
        show_hidden = true;
        show_symlink = true;
        scrolloff = 5;
        title_format = "Yazi: {cwd}";
        mouse_events = ["click" "drag" "scroll" "touch" "move"];
      };

      preview = {
        wrap = "no";
        image_filter = "lanczos3";
        image_delay = 30;
        image_quality = 75;
        tab_size = 2;
        max_width = 1000;
        max_height = 1000;
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

      plugin = {
        prepend_fetchers = [
          {
            url = "*";
            run = "git";
            group = "git";
          }
          {
            url = "*/";
            run = "git";
            group = "git";
          }
          {
            url = "local://*";
            run = "mime-ext.local";
            prio = "high";
            group = "mime";
          }
          {
            url = "remote://*";
            run = "mime-ext.remote";
            prio = "high";
            group = "mime";
          }
        ];

        prepend_previewers = [
          {
            mime = "text/markdown";
            run = "piper -- ${lib.getExe pkgs.glow} -s dark -w $w \"$1\"";
          }

          {
            mime = "application/json";
            run = "piper -- ${lib.getExe pkgs.jq} -C . \"$1\"";
          }
          {
            mime = "application/*zip";
            run = "piper -- ${lib.getExe pkgs.ouch} ls \"$1\"";
          }
          {
            mime = "application/x-tar";
            run = "piper -- ${lib.getExe pkgs.ouch} ls \"$1\"";
          }
        ];
      };
    };
  };
}
