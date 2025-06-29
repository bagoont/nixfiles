{
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
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
    initrd = {
      availableKernelModules = ["amdgpu" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = ["kvm-amd"];
      luks.devices."luks-774d261b-cf2a-45d1-8de7-a918697fe473".device = "/dev/disk/by-uuid/774d261b-cf2a-45d1-8de7-a918697fe473";
    };
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        extraEntries = ''
          menuentry "Windows" {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            search --fs-uuid --set=root "BDF1-35B6"
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
      };
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
