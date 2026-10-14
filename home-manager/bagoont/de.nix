{pkgs, ...}: {
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "com.mitchellh.ghostty.desktop"
      ];
    };
  };
  home.packages = [
    (pkgs.writeShellScriptBin "xterm-ghostty" ''
      exec ${pkgs.ghostty}/bin/ghostty "$@"
    '')
  ];
}
