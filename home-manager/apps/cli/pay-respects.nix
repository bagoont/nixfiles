{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.pay-respects = {
    enable = true;
    package = pkgs.pay-respects;
    enableFishIntegration = lib.mkIf config.programs.fish.enable true;
  };
}
