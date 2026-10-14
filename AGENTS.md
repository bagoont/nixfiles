# Agent Instructions

This repository is a personal NixOS + Home Manager flake for two hosts:
`ideapad` (laptop, niri, Secure Boot) and `homelab` (VM running self-hosted services).

## Structure

- `hosts/<name>/` — host-specific configuration.
- `hosts/common/` — shared NixOS modules, imported explicitly.
- `home-manager/bagoont/` — user configuration and per-host settings.
- `home-manager/common/<category>/` — reusable user modules.
- `modules/` — published, parameterized modules only; do not add personal configuration here.
- `pkgs/`, `overlays/` — local packages and overlays.
- `secrets/` — sops/age-encrypted secrets.

You may import an entire directory or select a single file — use the smallest
import that clearly expresses the intent.

## Style and Security

- One module, one responsibility; do not leave unused arguments.
- Use `lib.mkDefault` for values that hosts may override;
  use `mkForce` only deliberately.
- Prefer `with pkgs; [ ... ]` for package lists.
- Do not use `with lib;`, `import <nixpkgs>`, or deprecated aliases.
- Place shared logic in `hosts/common/` or `home-manager/common/`.
- Do not edit `secrets/**` or `.sops.yaml`, run sops, or store secrets in plaintext.
  Delete dead code rather than commenting it out.

## Validation

The flake formatter is `alejandra`:

```sh
nix fmt -- <changed-files>
nix fmt -- --check <changed-files>
nix run nixpkgs#statix -- check .
nix run nixpkgs#deadnix -- <changed-files>
nix eval --raw .#nixosConfigurations.<host>.config.system.build.toplevel.name
nix flake check
nixos-rebuild dry-build --flake .#<host>
```

After creating or renaming a file, add it to Git before evaluation: Nix only
sees tracked files. Do not run `nixos-rebuild switch`, `boot`, or `test`:
system activation is performed by the user.

The tools `pre-commit`, `mcp-nixos`, and `forgejo-mcp` are available through `shell.nix`.
Add new tools there; `.envrc` loads the development shell through direnv.

## Pi Agents

- `dev` — small changes under a clear contract; does not run builds.
- `runner` — read-only reconnaissance and requested validation.
- `security` — read-only audits of services, networking, authentication, and secrets.

The current conversation plans the work, delegates bounded tasks, and reviews the diff.
Changes to services, networking, authentication, or secrets require a security audit.
