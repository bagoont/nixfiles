{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    pre-commit
    mcp-nixos
    forgejo-mcp
  ];
}
