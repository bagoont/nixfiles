{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    package = pkgs.mpv-unwrapped.wrapper {
      scripts = with pkgs.mpvScripts; [
        uosc
        sponsorblock
        autoload
        mpv-notify-send
        thumbfast
      ];
      mpv = pkgs.mpv-unwrapped.override {
        waylandSupport = true;
      };
    };

    config = {
      profile = "gpu-hq";
      gpu-context = "wayland";
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}
