# NixOS configuration

My personal [NixOS](https://nixos.org/) and [Home Manager](https://github.com/nix-community/home-manager) configuration for a daily-driver laptop and a homelab. Both hosts are managed by a single Nix flake.

![niri desktop on ideapad](assets/screenshot.png)

## Hosts

| Host | Purpose | Configuration |
|---|---|---|
| `ideapad` | Laptop with a niri Wayland desktop, AMD graphics, encrypted Btrfs and Secure Boot | [System](hosts/ideapad/default.nix) · [Home Manager](home-manager/bagoont/hosts/ideapad.nix) |
| `homelab` | Proxmox VM running self-hosted services | [System](hosts/homelab/default.nix) · [Home Manager](home-manager/bagoont/hosts/homelab.nix) |

### Desktop and tools

- **Desktop:** niri with Noctalia Shell.
- **Terminal and shell:** Ghostty, Nushell, Starship and Carapace.
- **Editor and coding agent:** Neovim through NVF, with LSP, completion, debugging and Pi integration.
- **Files and media:** Yazi, imv, mpv and Zathura.
- **Development:** Git, Lazygit, Lazydocker and btop.
- **Browser and mail:** Zen Browser and Thunderbird.

Neovim, Pi, Nushell and Git are also configured for the homelab user. The graphical desktop is specific to `ideapad`.

See **[Keyboard Shortcuts](KEYBINDINGS.md)** for the configured bindings and everyday application defaults.

### Homelab services

The homelab configuration includes:

- **nginx** for reverse proxying and **Authelia** for authentication.
- **Forgejo** for Git hosting.
- **Vaultwarden** for password management.
- **OpenCloud** for file storage.
- **Open WebUI** for an AI chat interface.
- **PostgreSQL** and a [media stack](hosts/homelab/services/media/default.nix).

Service definitions live in [`hosts/homelab/services/`](hosts/homelab/services/).

## Repository layout

| Directory | Contents |
|---|---|
| [`hosts/`](hosts/) | Host-specific system configuration and shared NixOS modules |
| [`home-manager/`](home-manager/) | User profiles, application settings and reusable Home Manager modules |
| [`modules/`](modules/) | Exported, parameterized modules |
| [`pkgs/`](pkgs/) | Local package definitions |
| [`overlays/`](overlays/) | Package overlays |
| [`secrets/`](secrets/) | Encrypted secrets managed with sops-nix |
| [`assets/`](assets/) | Screenshots and documentation assets |

The flake entry point is [`flake.nix`](flake.nix). Home Manager is integrated into the NixOS configurations rather than managed as a separate deployment.

## Working with the configuration

The development environment is defined in [`shell.nix`](shell.nix). Enter it with `nix-shell`, or let direnv load it through [`.envrc`](.envrc). It includes `pre-commit`, `mcp-nixos` and `forgejo-mcp`.

Format Nix files and check the flake:

```sh
nix fmt
nix flake check
```

Check a host rebuild without activating it:

```sh
nixos-rebuild dry-build --flake .#ideapad
# or: nixos-rebuild dry-build --flake .#homelab
```

Add new Nix files to Git before evaluation so the Git-backed flake can see them. Apply changes on the intended host after reviewing the build.

## Reusing parts of this repository

This is a personal configuration, not a ready-to-install distribution. Hardware settings, domains, user details and secret references are specific to my machines. Reusable pieces are primarily in `hosts/common/`, `home-manager/common/` and `modules/`.

Secrets are encrypted with sops/age. They cannot be used without the corresponding decryption keys; provide your own secrets and hardware configuration when adapting these modules.
