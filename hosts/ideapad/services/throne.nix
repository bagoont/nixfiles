{
  networking.firewall.trustedInterfaces = ["docker0"];

  programs.throne = {
    enable = true;
    tunMode = {
      enable = true;
    };
  };
}
