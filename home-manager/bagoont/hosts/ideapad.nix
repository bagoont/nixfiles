{
  imports = [
    ../default.nix
    ../../common/shells
    ../../common/ghostty
    ../../common/editors
    ../../common/dev
    ../../common/media
    ../../common/apps
    ../../common/security
    ../../common/desktop
    ../../common/desktop/niri
    ../../common/zen.nix

    ../email.nix
    ../browser-zen.nix
    ../xdg.nix
    ../de.nix
  ];

  wayland.windowManager.niri.settings.input.touchpad = {
    click-method = "button-areas";
    dwt = {};
    dwtp = {};
    natural-scroll = {};
    scroll-method = "two-finger";
    tap = {};
    tap-button-map = "left-right-middle";
    accel-profile = "adaptive";
  };
}
