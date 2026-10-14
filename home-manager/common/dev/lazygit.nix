{
  pkgs,
  lib,
  ...
}: {
  programs.lazygit = {
    enable = true;
    settings = {
      git.diffRenderers = [
        {
          colorArg = "always";
          command = "${lib.getExe pkgs.delta} --dark --paging=never";
        }
      ];
    };
  };
}
