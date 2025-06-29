{
  services.openssh = {
    enable = true;
    settings = {
      # PermitRootLogin = "no";
      # PasswordAuthentication = false;
      # StreamLocalBindUnlink = "yes";
      AcceptEnv = "WAYLAND_DISPLAY";
    };
  };
}
