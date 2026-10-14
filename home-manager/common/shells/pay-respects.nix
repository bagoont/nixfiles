{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.pay-respects = {
    enable = true;
    package = pkgs.pay-respects;
    enableNushellIntegration = config.programs.nushell.enable;
  };
}
