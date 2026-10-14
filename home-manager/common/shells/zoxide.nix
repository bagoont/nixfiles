{
  lib,
  config,
  ...
}: {
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = config.programs.nushell.enable;
    options = [
      "--cmd cd"
      "--hook pwd"
    ];
  };
}
