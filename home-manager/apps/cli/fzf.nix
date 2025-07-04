{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fzf = {
    enable = true;
    enableFishIntegration = lib.mkIf config.programs.fish.enable true;
    colors = let
      base00 = "1e1e2e"; # base
      base01 = "181825"; # mantle
      base02 = "313244"; # surface0
      base03 = "45475a"; # surface1
      base04 = "585b70"; # surface2
      base05 = "cdd6f4"; # text
      base06 = "f5e0dc"; # rosewater
      base07 = "b4befe"; # lavender
      base08 = "f38ba8"; # red
      base09 = "fab387"; # peach
      base0A = "f9e2af"; # yellow
      base0B = "a6e3a1"; # green
      base0C = "94e2d5"; # teal
      base0D = "89b4fa"; # blue
      base0E = "cba6f7"; # mauve
      base0F = "f2cdcd"; # flamingo
    in {
      bg = "-1";
      "bg+" = "#${base02}";
      fg = "#${base05}";
      "fg+" = "#${base05}";
      header = "#${base08}";
      hl = "#${base08}";
      "hl+" = "#${base08}";
      info = "#${base0E}";
      marker = "#${base07}";
      pointer = "#${base06}";
      spinner = "#${base06}";
      prompt = "#${base0E}";
      selected-bg = "#${base03}";
      border = "#${base0D}";
      label = "#${base05}";
    };
    defaultCommand = "${lib.getExe pkgs.fd} --hidden --strip-cwd-prefix --exclude .git --exclude node_modules --exclude __pycache__ --exclude .venv";
    defaultOptions = [
      "--height=40%"
      "--layout=reverse"
      "--bind=ctrl-j:down,ctrl-k:up,ctrl-h:toggle-preview"
      "--preview='([[ -d {} ]] && ${lib.getExe pkgs.eza} --tree --level=2 --color=always {} | head -200) || (${lib.getExe pkgs.file} {} | grep -q binary && echo {} is binary) || ${lib.getExe pkgs.bat} --style=numbers --color=always --line-range=:500 {}'"
    ];
    fileWidgetCommand = "${lib.getExe pkgs.fd} --type file --follow --hidden --strip-cwd-prefix --exclude .git --exclude node_modules --exclude __pycache__ --exclude .venv";
    fileWidgetOptions = [
      "--preview '([[ -d {} ]] && ${lib.getExe pkgs.eza} --tree --level=2 --color=always {} | head -100) || (${lib.getExe pkgs.file} {} | grep -q binary && echo {} is binary) || ${lib.getExe pkgs.bat} --style=numbers --color=always --line-range=:500 {}'"
    ];
    historyWidgetOptions = [
      "--sort"
      "--exact"
      "--preview 'echo {}'"
      "--preview-window=up:3:hidden:wrap"
      "--bind ctrl-h:toggle-preview"
    ];
  };
}
