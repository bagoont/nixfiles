{lib, ...}: {
  qt = {
    enable = lib.mkDefault true;
    platformTheme.name = lib.mkDefault "qtct";
  };
}
