{...}: {
  imports = [
    ../common/base.nix

    ./hardware-configuration.nix
    ./greeter.nix
    ./networking.nix

    ../common/btrfs.nix
    ../common/containers.nix
    ../common/openssh.nix
    ../common/fstrim.nix
    ../common/tpm.nix
    ../common/pipewire.nix
    ../common/graphics.nix
    ../common/security.nix
    ../common/thermald.nix
    ../common/fail2ban.nix
    ../common/udisks.nix
    ./services/throne.nix
  ];

  users.users.bagoont.extraGroups = [
    "networkmanager"
    "wheel"
    "input"
    "audio"
    "video"
    "render"
    "docker"
  ];

  home-manager.users.bagoont = import ../../home-manager/bagoont/hosts/ideapad.nix;

  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    accounts-daemon.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  console = {
    enable = true;
    earlySetup = true;
    font = "Cyr_a8x16";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";
}
