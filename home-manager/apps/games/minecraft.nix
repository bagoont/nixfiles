{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.prismlauncher.overlays.default];

  home.packages = with pkgs; [pkgs.prismlauncher];
}
