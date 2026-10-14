{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    git-fixup
  ];

  programs.git = {
    enable = true;

    settings = {
      aliases = {
        p = "pull --ff-only";
        ff = "merge --ff-only";
        graph = "log --decorate --oneline --graph";
        pushall = "!git remote | xargs -L1 git push --all";
        add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
      };

      lfs = {
        enable = true;
        skipSmudge = false;
      };

      diff = {
        colorMoved = "default";
        tool = lib.getExe pkgs.meld;
      };

      extraConfig = {
        core.editor = "nvim";
        push.autoSetupRemote = true;
        rebase.autosquash = true;
        rebase.autoStash = true;
        init.defaultBranch = "main";
        commit.verbose = true;
        diff.algorithm = "histogram";
        pull.rebase = true;
      };
    };
  };
}
