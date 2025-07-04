{pkgs, ...}: {
  services.gammastep = {
    enable = true;
    package = pkgs.gammastep;
    provider = "geoclue2";
    settings.general.adjustment-method = "wayland";
  };
}
