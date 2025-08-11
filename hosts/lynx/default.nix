{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix
    ./greetd.nix
    ./networking.nix

    ../apps/sops.nix
    ../apps/btrfs.nix
    ../apps/openssh.nix
    ../apps/fstrim.nix
    ../apps/nekoray.nix
    ../apps/dbus.nix
    ../apps/tpm.nix
    ../apps/pipewire.nix
    ../apps/security.nix
    ../apps/auto-cpufreq.nix
    ../apps/thermald.nix
    ../apps/fail2ban.nix
    ../apps/udisks.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  location.provider = "geoclue2";
  time.timeZone = "Asia/Tomsk";

  console = {
    enable = true;
    earlySetup = true;
    font = "Cyr_a8x16";
  };

  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  sops.secrets = {
    "bagoont/password" = {neededForUsers = true;};
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users.bagoont = import ../../home-manager/bagoont/lynx.nix;
  };

  programs.fish.enable = true;
  users.users.bagoont = {
    hashedPasswordFile = config.sops.secrets."bagoont/password".path;
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "input" "audio" "video" "render"];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";
}
