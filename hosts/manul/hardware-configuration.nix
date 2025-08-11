{
  inputs,
  config,
  pkgs,
  lib,
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
        clinfo
        rocmPackages.clr.icd
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
      availableKernelModules = ["amdgpu" "xhci_pci" "ahci" "usb_storage" "sd_mod"];
      systemd = {
        tpm2.enable = true;
        enable = true;
      };
      luks.devices = {
        "luks-774d261b-cf2a-45d1-8de7-a918697fe473".device = "/dev/disk/by-uuid/774d261b-cf2a-45d1-8de7-a918697fe473";
        "luks-cee2a805-188f-44b6-b577-879243c0eb6c".device = "/dev/disk/by-uuid/f55c2928-c46b-4d05-bf7f-ae71be04e3da";
      };
    };
    loader.systemd-boot.enable = lib.mkForce false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/401b8e14-f712-421c-a450-d29dec7ec8ec";
    fsType = "btrfs";
    options = ["noatime" "compress-force=zstd" "commit=120" "space_cache=v2" "ssd" "discard=async" "autodefrag" "subvol=@"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/BDF1-35B6";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [{device = "/dev/disk/by-uuid/26ffa242-482b-4867-8014-58c44f2acb1c";}];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
