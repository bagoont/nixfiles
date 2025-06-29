{
  programs.git = {
    enable = true;

    delta = {
      enable = true;
      options.dark = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
      diff.colorMoved = "default";
      merge = {
        conflictstyle = "zdiff3";
        tool = "nvim";
      };
      mergetool.nvim.cmd = ''nvim -d -c "wincmd l" -c "norm ]c" "$LOCAL" "$MERGED" "$REMOTE"'';
      commit.verbose = true;
      diff.algorithm = "histogram";
      pull.rebase = true;
      safe.directory = "/etc/nixos";
    };
  };
}
