{config, ...}: {
  programs.carapace = {
    enable = true;
    enableNushellIntegration = config.programs.nushell.enable;
  };
}
