{
  lib,
  modulesPath,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" "tun"];
      kernelModules = [];
    };
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/9f45f53d-eb80-4ab3-9659-d3f893f90ed4";
      fsType = "btrfs";
      options = ["noatime" "compress-force=zstd" "autodefrag" "subvol=@"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/9f45f53d-eb80-4ab3-9659-d3f893f90ed4";
      fsType = "btrfs";
      options = ["noatime" "compress-force=zstd" "autodefrag" "subvol=@home"];
    };

    "/srv" = {
      device = "/dev/disk/by-uuid/9f45f53d-eb80-4ab3-9659-d3f893f90ed4";
      fsType = "btrfs";
      options = ["noatime" "compress-force=zstd" "autodefrag" "subvol=@srv"];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/9f45f53d-eb80-4ab3-9659-d3f893f90ed4";
      fsType = "btrfs";
      options = ["noatime" "compress-force=zstd" "autodefrag" "subvol=@nix"];
    };

    "/var/cache" = {
      device = "/dev/disk/by-uuid/9f45f53d-eb80-4ab3-9659-d3f893f90ed4";
      fsType = "btrfs";
      options = ["noexec" "nodev" "nosuid" "noatime" "compress-force=zstd" "autodefrag" "subvol=@cache"];
    };

    "/var/log" = {
      device = "/dev/disk/by-uuid/9f45f53d-eb80-4ab3-9659-d3f893f90ed4";
      fsType = "btrfs";
      options = ["noexec" "nodev" "nosuid" "noatime" "compress-force=zstd" "autodefrag" "subvol=@log"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/6EDC-B6D2";
      fsType = "vfat";
      options = ["nodev" "nosuid" "noexec" "fmask=0022" "dmask=0022"];
    };
  };
  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024;
    }
  ];
  zramSwap.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
