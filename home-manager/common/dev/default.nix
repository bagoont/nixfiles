{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./git.nix
    ./direnv.nix
    ./lazygit.nix
    ./lazydocker.nix
    ./btop.nix
  ];

  home.packages = with pkgs; [
    dbeaver-bin
    mutagen
  ];
}
