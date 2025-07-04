{pkgs, ...}: {
  imports = [
    ./lazydocker.nix
  ];

  services.podman = {
    enable = true;
    package = pkgs.podman;
  };
  home.packages = with pkgs; [
    podlet
    podman-compose
  ];
}
