{
  lib,
  pkgs,
  config,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    Mod = "Mod";
    sh = spawn "sh" "-c";
    defaultApp = type: "${lib.getExe pkgs.handlr-regex} launch ${type}";
  in {
    "${Mod}+Return".action = sh "${defaultApp "x-scheme-handler/terminal"}";
    "${Mod}+T".action = sh "${defaultApp "x-scheme-handler/terminal"}";
    "${Mod}+B".action = sh "${defaultApp "x-scheme-handler/https"}";
    "${Mod}+E".action = sh "${defaultApp "text/plain"}";
    "${Mod}+Space".action = sh "anyrun 2>/dev/null";
    "${Mod}+Escape".action = toggle-overview;
    "${Mod}+Shift+O".action = show-hotkey-overlay;

    "${Mod}+Q".action = close-window;

    "${Mod}+D".action = toggle-column-tabbed-display;

    "Print".action = screenshot-window;
    "Shift+Print".action = screenshot;
    "${Mod}+Shift+S".action = screenshot;

    "${Mod}+Insert".action = set-dynamic-cast-window;
    "${Mod}+Shift+Insert".action = set-dynamic-cast-monitor;
    "${Mod}+Delete".action = clear-dynamic-cast-target;

    "XF86AudioMute".action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    "XF86AudioLowerVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
    "XF86AudioRaiseVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
    "XF86AudioPlay".action = sh "${lib.getExe pkgs.playerctl} -a play-pause";
    "XF86AudioPrev".action = sh "${lib.getExe pkgs.playerctl} -a previous";
    "XF86AudioNext".action = sh "${lib.getExe pkgs.playerctl} -a next";
    "XF86AudioMicMute".action = sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    "XF86MonBrightnessUp".action = sh "brightnessctl set 10%+";
    "XF86MonBrightnessDown".action = sh "brightnessctl set 10%-";
    "XF86AudioMute".allow-when-locked = true;
    "XF86AudioMicMute".allow-when-locked = true;
    "XF86AudioPlay".allow-when-locked = true;
    "XF86AudioPrev".allow-when-locked = true;
    "XF86AudioNext".allow-when-locked = true;
    "XF86AudioLowerVolume".allow-when-locked = true;
    "XF86AudioRaiseVolume".allow-when-locked = true;
    "XF86MonBrightnessUp".allow-when-locked = true;
    "XF86MonBrightnessDown".allow-when-locked = true;

    "${Mod}+Tab".action = focus-window-down-or-column-right;
    "${Mod}+Shift+Tab".action = focus-window-up-or-column-left;

    "${Mod}+Left".action = focus-column-left;
    "${Mod}+Down".action = focus-window-down;
    "${Mod}+Up".action = focus-window-up;
    "${Mod}+Right".action = focus-column-right;

    "${Mod}+Shift+Left".action = move-column-left;
    "${Mod}+Shift+Down".action = move-window-down;
    "${Mod}+Shift+Up".action = move-window-up;
    "${Mod}+Shift+Right".action = move-column-right;

    "${Mod}+Ctrl+Left".action = focus-monitor-left;
    "${Mod}+Ctrl+Down".action = focus-monitor-down;
    "${Mod}+Ctrl+Up".action = focus-monitor-up;
    "${Mod}+Ctrl+Right".action = focus-monitor-right;

    "${Mod}+Shift+Ctrl+Left".action = move-window-to-monitor-left;
    "${Mod}+Shift+Ctrl+Down".action = move-window-to-monitor-down;
    "${Mod}+Shift+Ctrl+Up".action = move-window-to-monitor-up;
    "${Mod}+Shift+Ctrl+Right".action = move-window-to-monitor-right;

    "${Mod}+H".action = focus-column-left;
    "${Mod}+J".action = focus-window-down;
    "${Mod}+K".action = focus-window-up;
    "${Mod}+L".action = focus-column-right;

    "${Mod}+Shift+H".action = move-column-left;
    "${Mod}+Shift+J".action = move-window-down;
    "${Mod}+Shift+K".action = move-window-up;
    "${Mod}+Shift+L".action = move-column-right;

    "${Mod}+Ctrl+H".action = focus-monitor-left;
    "${Mod}+Ctrl+J".action = focus-monitor-down;
    "${Mod}+Ctrl+K".action = focus-monitor-up;
    "${Mod}+Ctrl+L".action = focus-monitor-right;

    "${Mod}+Shift+Ctrl+H".action = move-window-to-monitor-left;
    "${Mod}+Shift+Ctrl+J".action = move-window-to-monitor-down;
    "${Mod}+Shift+Ctrl+K".action = move-window-to-monitor-up;
    "${Mod}+Shift+Ctrl+L".action = move-window-to-monitor-right;

    "${Mod}+V".action = switch-focus-between-floating-and-tiling;
    "${Mod}+Shift+V".action = toggle-window-floating;

    "${Mod}+Home".action = focus-column-first;
    "${Mod}+End".action = focus-column-last;

    "${Mod}+Shift+Home".action = move-column-to-first;
    "${Mod}+Shift+End".action = move-column-to-last;

    "${Mod}+1".action.focus-workspace = 1;
    "${Mod}+2".action.focus-workspace = 2;
    "${Mod}+3".action.focus-workspace = 3;
    "${Mod}+4".action.focus-workspace = 4;
    "${Mod}+5".action.focus-workspace = 5;
    "${Mod}+6".action.focus-workspace = 6;
    "${Mod}+7".action.focus-workspace = 7;
    "${Mod}+8".action.focus-workspace = 8;
    "${Mod}+9".action.focus-workspace = 9;

    "${Mod}+Shift+1".action.move-window-to-workspace = 1;
    "${Mod}+Shift+2".action.move-window-to-workspace = 2;
    "${Mod}+Shift+3".action.move-window-to-workspace = 3;
    "${Mod}+Shift+4".action.move-window-to-workspace = 4;
    "${Mod}+Shift+5".action.move-window-to-workspace = 5;
    "${Mod}+Shift+6".action.move-window-to-workspace = 6;
    "${Mod}+Shift+7".action.move-window-to-workspace = 7;
    "${Mod}+Shift+8".action.move-window-to-workspace = 8;
    "${Mod}+Shift+9".action.move-window-to-workspace = 9;

    "${Mod}+Comma".action = consume-window-into-column;
    "${Mod}+Period".action = expel-window-from-column;

    "${Mod}+R".action = switch-preset-column-width;
    "${Mod}+F".action = maximize-column;
    "${Mod}+Shift+F".action = fullscreen-window;
    "${Mod}+C".action = center-column;

    "${Mod}+Minus".action = set-column-width "-10%";
    "${Mod}+Equal".action = set-column-width "+10%";
    "${Mod}+Shift+Minus".action = set-window-height "-10%";
    "${Mod}+Shift+Equal".action = set-window-height "+10%";

    "${Mod}+Shift+Ctrl+T".action = toggle-debug-tint;
  };
}
