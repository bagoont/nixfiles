{pkgs, ...}: {
  programs.mpv = {
    package = pkgs.mpv-unwrapped.wrapper {
      scripts = with pkgs.mpvScripts; [
        uosc
        sponsorblock
      ];

      mpv = pkgs.mpv-unwrapped.override {
        waylandSupport = true;
      };
    };

    enable = true;
    config = {
      profile = "gpu-hq";
      gpu-context = "wayland";
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}
