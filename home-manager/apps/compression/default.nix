{pkgs, ...}: {
  home.packages = with pkgs; [
    p7zip
    zip
    rar
    file-roller
  ];
}
