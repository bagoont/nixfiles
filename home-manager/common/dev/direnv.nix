{config, ...}: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableNushellIntegration = config.programs.nushell.enable;
  };
}
