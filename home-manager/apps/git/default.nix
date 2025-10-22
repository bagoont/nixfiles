{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./lazygit.nix
    ./delta.nix
  ];

  home.packages = with pkgs; [
    git-fixup
  ];

  programs.git = {
    enable = true;
    package = pkgs.git;

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

      extraConfig = {
        core.editor = "$EDITOR";
        github.user = "bagoont";
        push.autoSetupRemote = true;
        rebase.autosquash = true;
        rebase.autoStash = true;
        init.defaultBranch = "main";
        diff = {
          colorMoved = "default";
          tool = lib.getExe pkgs.meld;
        };
        merge = {
          conflictstyle = "zdiff3";
          tool = lib.getExe pkgs.meld;
        };
        commit.verbose = true;
        diff.algorithm = "histogram";
        pull.rebase = true;
        safe.directory = "/etc/nixos";
      };
    };
  };
}
