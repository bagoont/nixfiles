{
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.niri.settings.binds = let
    Mod = "Mod";
    sh = cmd: ["sh" "-c" cmd];
    noctalia-msg = args: ["noctalia" "msg"] ++ args;
    defaultApp = type: "${lib.getExe pkgs.handlr-regex} launch ${type}";
  in {
    "${Mod}+Space" = {
      _props.hotkey-overlay-title = "Toggle Application Launcher";
      spawn = noctalia-msg ["panel-toggle" "launcher"];
    };
    "${Mod}+Alt+L" = {
      _props.hotkey-overlay-title = "Lock Session";
      spawn = noctalia-msg ["session" "lock"];
    };
    "${Mod}+X" = {
      _props.hotkey-overlay-title = "Toggle Power Menu";
      spawn = noctalia-msg ["panel-toggle" "session"];
    };
    "${Mod}+P" = {
      _props.hotkey-overlay-title = "Toggle Clipboard Manager";
      spawn = noctalia-msg ["panel-toggle" "clipboard"];
    };
    # TODO: AI assistant was a shell-specific plugin; no noctalia equivalent configured.
    # "${Mod}+A" = {
    #   _props.hotkey-overlay-title = "Toggle AI Assistant";
    #   spawn = noctalia-msg ["dummy-no-equivalent"];
    # };
    "${Mod}+Return" = {
      _props.hotkey-overlay-title = "Open default terminal.";
      spawn = sh (defaultApp "x-scheme-handler/terminal");
    };
    "${Mod}+T" = {
      _props.hotkey-overlay-title = "Open default terminal.";
      spawn = sh (defaultApp "x-scheme-handler/terminal");
    };
    "${Mod}+E" = {
      _props.hotkey-overlay-title = "Open default editor.";
      spawn = sh (defaultApp "text/plain");
    };

    "Print" = {
      _props.hotkey-overlay-title = "Capture screen.";
      spawn = noctalia-msg ["screenshot-fullscreen"];
    };
    # TODO: noctalia has no window-screenshot command; only fullscreen/region.
    # "Shift+Print" = {
    #   _props.hotkey-overlay-title = "Capture window.";
    #   spawn = noctalia-msg ["screenshot-window"];
    # };
    "${Mod}+Shift+S" = {
      _props.hotkey-overlay-title = "Capture selection.";
      spawn = noctalia-msg ["screenshot-region"];
    };

    "XF86AudioLowerVolume" = {
      _props.allow-when-locked = true;
      spawn = noctalia-msg ["volume-down"];
    };
    "XF86AudioRaiseVolume" = {
      _props.allow-when-locked = true;
      spawn = noctalia-msg ["volume-up"];
    };
    "XF86AudioMute" = {
      _props.allow-when-locked = true;
      spawn = noctalia-msg ["volume-mute"];
    };
    "XF86AudioMicMute" = {
      _props.allow-when-locked = true;
      spawn = noctalia-msg ["mic-mute"];
    };
    "XF86MonBrightnessUp" = {
      _props.allow-when-locked = true;
      spawn = noctalia-msg ["brightness-up"];
    };
    "XF86MonBrightnessDown" = {
      _props.allow-when-locked = true;
      spawn = noctalia-msg ["brightness-down"];
    };

    "XF86AudioPlay" = {
      _props.allow-when-locked = true;
      spawn = sh "${lib.getExe pkgs.playerctl} -a play-pause";
    };
    "XF86AudioPrev" = {
      _props.allow-when-locked = true;
      spawn = sh "${lib.getExe pkgs.playerctl} -a previous";
    };
    "XF86AudioNext" = {
      _props.allow-when-locked = true;
      spawn = sh "${lib.getExe pkgs.playerctl} -a next";
    };

    "${Mod}+Escape".toggle-overview = {};
    "${Mod}+Shift+O".show-hotkey-overlay = {};

    "${Mod}+Q".close-window = {};

    "${Mod}+Tab".focus-window-down-or-column-right = {};
    "${Mod}+Shift+Tab".focus-window-up-or-column-left = {};

    "${Mod}+Left".focus-column-left = {};
    "${Mod}+Down".focus-window-down = {};
    "${Mod}+Up".focus-window-up = {};
    "${Mod}+Right".focus-column-right = {};

    "${Mod}+Shift+Left".move-column-left = {};
    "${Mod}+Shift+Down".move-window-down = {};
    "${Mod}+Shift+Up".move-window-up = {};
    "${Mod}+Shift+Right".move-column-right = {};

    "${Mod}+Ctrl+Left".focus-monitor-left = {};
    "${Mod}+Ctrl+Down".focus-monitor-down = {};
    "${Mod}+Ctrl+Up".focus-monitor-up = {};
    "${Mod}+Ctrl+Right".focus-monitor-right = {};

    "${Mod}+Shift+Ctrl+Left".move-window-to-monitor-left = {};
    "${Mod}+Shift+Ctrl+Down".move-window-to-monitor-down = {};
    "${Mod}+Shift+Ctrl+Up".move-window-to-monitor-up = {};
    "${Mod}+Shift+Ctrl+Right".move-window-to-monitor-right = {};

    "${Mod}+H".focus-column-left = {};
    "${Mod}+J".focus-window-down = {};
    "${Mod}+K".focus-window-up = {};
    "${Mod}+L".focus-column-right = {};

    "${Mod}+Shift+H".move-column-left = {};
    "${Mod}+Shift+J".move-window-down = {};
    "${Mod}+Shift+K".move-window-up = {};
    "${Mod}+Shift+L".move-column-right = {};

    "${Mod}+Ctrl+H".focus-monitor-left = {};
    "${Mod}+Ctrl+J".focus-monitor-down = {};
    "${Mod}+Ctrl+K".focus-monitor-up = {};
    "${Mod}+Ctrl+L".focus-monitor-right = {};

    "${Mod}+Shift+Ctrl+H".move-window-to-monitor-left = {};
    "${Mod}+Shift+Ctrl+J".move-window-to-monitor-down = {};
    "${Mod}+Shift+Ctrl+K".move-window-to-monitor-up = {};
    "${Mod}+Shift+Ctrl+L".move-window-to-monitor-right = {};

    "${Mod}+V".switch-focus-between-floating-and-tiling = {};
    "${Mod}+Shift+V".toggle-window-floating = {};

    "${Mod}+Home".focus-column-first = {};
    "${Mod}+End".focus-column-last = {};

    "${Mod}+Shift+Home".move-column-to-first = {};
    "${Mod}+Shift+End".move-column-to-last = {};

    "${Mod}+1".focus-workspace = 1;
    "${Mod}+2".focus-workspace = 2;
    "${Mod}+3".focus-workspace = 3;
    "${Mod}+4".focus-workspace = 4;
    "${Mod}+5".focus-workspace = 5;
    "${Mod}+6".focus-workspace = 6;
    "${Mod}+7".focus-workspace = 7;

    "${Mod}+9".focus-workspace = 9;

    "${Mod}+Shift+1".move-window-to-workspace = 1;
    "${Mod}+Shift+2".move-window-to-workspace = 2;
    "${Mod}+Shift+3".move-window-to-workspace = 3;
    "${Mod}+Shift+4".move-window-to-workspace = 4;
    "${Mod}+Shift+5".move-window-to-workspace = 5;
    "${Mod}+Shift+6".move-window-to-workspace = 6;
    "${Mod}+Shift+7".move-window-to-workspace = 7;
    "${Mod}+Shift+8".move-window-to-workspace = 8;
    "${Mod}+Shift+9".move-window-to-workspace = 9;

    # "${Mod}+Comma".consume-window-into-column = {};
    # "${Mod}+Period".expel-window-from-column = {};

    "${Mod}+R".switch-preset-column-width = {};
    "${Mod}+F".maximize-column = {};
    "${Mod}+Shift+F".fullscreen-window = {};
    "${Mod}+C".center-column = {};

    "${Mod}+Minus".set-column-width = "-10%";
    "${Mod}+Equal".set-column-width = "+10%";
    "${Mod}+Shift+Minus".set-window-height = "-10%";
    "${Mod}+Shift+Equal".set-window-height = "+10%";

    "${Mod}+Shift+Ctrl+T".toggle-debug-tint = {};
  };
}
