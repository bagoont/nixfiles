{pkgs, ...}: {
  systemd.user.services.swww = {
    Unit = {
      Description = "A Solution to your Wayland Wallpaper Woes";
      Documentation = ["man:swww-daemon(1)"];
      After = ["graphical-session.target"];
      Requires = ["graphical-session.target"];
    };
    Service = {
      Type = "notify";
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
