{pkgs, ...}: {
  imports = [
    ./bat.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./jq.nix
    ./pay-respects.nix
    ./zoxide.nix
  ];
  home.packages = with pkgs; [
    tokei
    dysk
    yq-go
    fx
  ];

  home.shellAliases = {
    df = "dysk";
  };
}
