{config, ...}: {
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;
      extraConfig = {
        SCREENSHOTS = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };

    mimeApps = {
      enable = true;
      associations.added = {
        "x-scheme-handler/terminal" = ["com.mitchellh.ghostty.desktop"];
      };

      defaultApplications = {
        "image/jpeg" = ["imv.desktop" "gimp.desktop"];
        "image/png" = ["imv.desktop" "gimp.desktop"];
        "image/gif" = ["imv.desktop" "gimp.desktop"];
        "image/webp" = ["imv.desktop" "gimp.desktop"];
        "image/bmp" = ["imv.desktop" "gimp.desktop"];
        "image/tiff" = ["imv.desktop" "gimp.desktop"];
        "image/svg+xml" = ["imv.desktop" "gimp.desktop"];
        "image/x-xcf" = ["imv.desktop" "gimp.desktop"];

        "video/mp4" = ["mpv.desktop"];
        "video/webm" = ["mpv.desktop"];
        "video/x-matroska" = ["mpv.desktop"];
        "video/avi" = ["mpv.desktop"];
        "video/x-msvideo" = ["mpv.desktop"];
        "audio/mpeg" = ["mpv.desktop"];
        "audio/ogg" = ["mpv.desktop"];
        "audio/flac" = ["mpv.desktop"];
        "audio/wav" = ["mpv.desktop"];

        "text/html" = ["zen-twilight.desktop"];
        "application/xhtml+xml" = ["zen-twilight.desktop"];
        "x-scheme-handler/http" = ["zen-twilight.desktop"];
        "x-scheme-handler/https" = ["zen-twilight.desktop"];
        "x-scheme-handler/ftp" = ["zen-twilight.desktop"];

        "application/pdf" = ["org.pwmt.zathura.desktop"];

        "inode/directory" = ["yazi.desktop"];

        "x-scheme-handler/terminal" = ["com.mitchellh.ghostty.desktop"];

        "x-scheme-handler/mailto" = ["thunderbird.desktop"];
        "text/calendar" = ["thunderbird.desktop"];

        "text/plain" = ["nvim.desktop"];
        "text/x-c" = ["nvim.desktop"];
        "text/x-c++" = ["nvim.desktop"];
        "text/x-python" = ["nvim.desktop"];
        "text/x-java" = ["nvim.desktop"];
        "text/x-shellscript" = ["nvim.desktop"];
        "text/x-makefile" = ["nvim.desktop"];
        "text/markdown" = ["nvim.desktop"];
        "text/x-yaml" = ["nvim.desktop"];
        "text/x-toml" = ["nvim.desktop"];
        "text/xml" = ["nvim.desktop"];
        "application/json" = ["nvim.desktop"];
        "application/xml" = ["nvim.desktop"];

        "text/x-sql" = ["dbeaver.desktop"];
        "application/sql" = ["dbeaver.desktop"];

        "x-scheme-handler/tg" = ["org.telegram.desktop.desktop"];
        "x-scheme-handler/tonsite" = ["org.telegram.desktop.desktop"];
        "x-scheme-handler/magnet" = ["transmission-gtk.desktop"];
      };
    };
  };
}
