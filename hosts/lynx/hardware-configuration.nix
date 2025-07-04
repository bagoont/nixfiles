{
  inputs,
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        amdvlk
      ];
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  boot = {
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod"];
      systemd = {
        tpm2.enable = true;
        enable = true;
      };
      luks.devices = {
        "luks-90cf550a-4259-46d1-bba9-f36669f3290e".device = "/dev/disk/by-uuid/e5f825f6-477c-451c-aa44-3282a000db48";
        "luks-c98931f6-473b-49fb-8025-07dc3706fb4a".device = "/dev/disk/by-uuid/030e31d8-6796-4a2e-bf37-666aba9f0c9f";
        "luks-5ccfa9b0-a470-49af-817d-165de2e31e4e".device = "/dev/disk/by-uuid/afeb9fa9-39ea-4950-9be6-ae72940a760e";
      };
    };
    loader.systemd-boot.enable = lib.mkForce false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/bd537f2b-a245-48d7-8eff-c84b9c7d254e";
    fsType = "btrfs";
    options = ["noatime" "compress-force=zstd" "autodefrag" "space_cache=v2" "ssd" "commit=120" "discard=async" "subvol=@"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/1fbaf0ea-4ac0-4c07-bedb-9f8b1853acee";
    fsType = "btrfs";
    options = ["noatime" "compress-force=zstd" "autodefrag" "subvol=@home"];
  };

  fileSystems."/.snapshots" = {
    device = "/dev/disk/by-uuid/1fbaf0ea-4ac0-4c07-bedb-9f8b1853acee";
    fsType = "btrfs";
    options = ["noatime" "compress-force=zstd" "autodefrag" "subvol=@snapshots"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4B04-2936";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/99e06aaa-68e6-41b3-b99a-12d7c05220cc";}
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
