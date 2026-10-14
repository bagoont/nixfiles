{...}: {
  imports = [
    ../common/base.nix

    ./hardware-configuration.nix
    ./networking.nix

    ../common/btrfs.nix
    ../common/containers.nix
    ../common/fstrim.nix
    ../common/openssh.nix
    ./services/media
    ./services/nginx.nix
    ./services/newt.nix
    ./services/postgres.nix
    ./services/forgejo.nix
    ./services/vaultwarden.nix
    ./services/authelia.nix
    ./services/open-webui.nix
    ./services/opencloud.nix
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
  };

  documentation.man.cache.enable = false;

  services = {
    qemuGuest.enable = true;
    openssh = {
      ports = [4165];
    };
  };

  sops.secrets = {
    "email/no-reply/password" = {sopsFile = ../../secrets/email.yaml;};
  };

  home-manager.users.bagoont = import ../../home-manager/bagoont/hosts/homelab.nix;

  programs.nushell.enable = true;
  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
  };

  users.users.bagoont.extraGroups = ["wheel" "docker"];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";
}
