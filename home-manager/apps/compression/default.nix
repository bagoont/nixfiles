{pkgs, ...}: {
  home.packages = with pkgs; [
    p7zip
    zip
    unzip
    rar
    file-roller
  ];
}
