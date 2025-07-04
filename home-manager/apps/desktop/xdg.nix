{config, ...}: {
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };

    mimeApps = {
      enable = true;
      associations.added = {
        "x-scheme-handler/terminal" = ["ghostty.desktop"];
      };

      defaultApplications = let
        browsers = [
          "firefox.desktop"
        ];
        videoPlayers = [
          "mpv"
        ];
        imageViewers = [
          "imv.desktop"
        ];
        codeEditors = [
          "nvim.desktop"
          "dev.zed.Zed.desktop"
        ];
        pdfViewers = [
          "zathura.desktop"
        ];
      in {
        "audio/mp3" = videoPlayers;
        "audio/aac" = videoPlayers;
        "audio/wav" = videoPlayers;
        "audio/*" = videoPlayers;

        "video/mp4" = videoPlayers;
        "video/mpeg" = videoPlayers;
        "video/mov" = videoPlayers;
        "video/*" = videoPlayers;
        "video/avi" = videoPlayers;
        "video/mkv" = videoPlayers;

        "image/png" = imageViewers;
        "image/jpeg" = imageViewers;
        "image/gif" = imageViewers;
        "image/bmp" = imageViewers;
        "image/jpg" = imageViewers;
        "image/tiff" = imageViewers;
        "image/x-bmp" = imageViewers;
        "image/x-ico" = imageViewers;
        "image/heic" = imageViewers;
        "image/heif" = imageViewers;
        "image/*" = imageViewers;

        "text/plain" = codeEditors;
        "text/x-c" = codeEditors;
        "text/x-c++" = codeEditors;
        "text/x-c++src" = codeEditors;
        "text/x-chdr" = codeEditors;
        "text/x-csrc" = codeEditors;
        "text/x-diff" = codeEditors;
        "text/x-dsrc" = codeEditors;
        "text/x-haskell" = codeEditors;
        "text/x-java" = codeEditors;
        "text/x-makefile" = codeEditors;
        "text/x-moc" = codeEditors;
        "text/x-pcs-gcd" = codeEditors;
        "text/x-perl" = codeEditors;
        "text/x-python" = codeEditors;
        "text/x-scala" = codeEditors;
        "text/x-scheme" = codeEditors;
        "text/css" = codeEditors;
        "text/javascript" = codeEditors;
        "application/json" = codeEditors;
        "application/ld+json" = codeEditors;

        "application/pdf" = pdfViewers;

        "text/html" = browsers;
        "x-scheme-handler/http" = browsers;
        "x-scheme-handler/https" = browsers;
        "text/xml" = browsers;
        "application/x-extension-htm" = browsers;
        "application/x-extension-html" = browsers;
        "application/x-extension-shtml" = browsers;
        "application/xhtml+xml" = browsers;
        "application/x-extension-xhtml" = browsers;
        "application/x-extension-xht" = browsers;
        "x-scheme-handler/ftp" = browsers;

        "inode/director" = ["yazi"];
        "application/x-xz-compressed-tar" = ["org.gnome.FileRoller.desktop"];
        "x-scheme-handler/mailto" = ["thunderbird.desktop"];
        "x-scheme-handler/terminal" = ["ghostty.desktop"];
        "x-scheme-handler/tg" = ["org.telegram.desktop.desktop"];
        "x-scheme-handler/tonsite" = ["org.telegram.desktop.desktop"];
        "x-scheme-handler/magnet" = ["transmission-gtk.desktop"];
      };
    };
  };
}
