{
  lib,
  config,
  ...
}: {
  programs.zoxide = {
    enable = true;
    enableFishIntegration = lib.mkIf config.programs.fish.enable true;
    options = [
      "--cmd cd"
      "--hook pwd"
    ];
  };
}
