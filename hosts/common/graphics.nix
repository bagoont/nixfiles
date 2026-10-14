{
  lib,
  pkgs,
  ...
}: {
  # GPU graphics stack (ex hardware.opengl). Explicit so it does not rely on
  # defaults or on the Steam module setting it implicitly.
  hardware.graphics = {
    enable = lib.mkDefault true;
    # 32-bit drivers for Steam / Wine / 32-bit games (AMD Radeon on ideapad).
    enable32Bit = lib.mkDefault true;
    # AMD: VA-API (radeonsi) and VDPAU ship with Mesa — nothing extra needed.
    # extraPackages = [ ]; # e.g. pkgs.amdvlk for the alternative Vulkan driver
  };

  environment.systemPackages = with pkgs; [
    libva-utils # vainfo: check VA-API acceleration
    vulkan-tools # vulkaninfo, vkcube
  ];
}
