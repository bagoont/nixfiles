{pkgs, ...}: {
  virtualisation = {
    podman = {
      enable = true;
      package = pkgs.podman;
      autoPrune.enable = true;
      dockerCompat = true;
    };
    containers.storage.settings = {
      storage = {
        driver = "btrfs";
        runroot = "/run/containers/storage";
        graphroot = "/var/lib/containers/storage";
        options.overlay.mountopt = "nodev,metacopy=on";
      };
    };
  };
}
