{pkgs, ...}: {
  users.users."jellyfin" = {
    isSystemUser = true;
    createHome = false;
    extraGroups = ["media"];
  };
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jellyfin";
  };
}
