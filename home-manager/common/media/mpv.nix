{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    package = (
      pkgs.mpv.override {
        mpv-unwrapped = pkgs.mpv-unwrapped.override {
          ffmpeg = pkgs.ffmpeg-full;
          waylandSupport = true;
        };
      }
    );
    config = {
      profile = "gpu-hq";
      gpu-context = "wayland";
      ytdl-format = "bestvideo[height>=?1440][vcodec^=vp9]+bestaudio/bestvideo[height<=?1440][vcodec^=av0]+bestaudio/bestvideo+bestaudio/best";
    };
  };
}
