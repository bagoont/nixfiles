# Keyboard Shortcuts

A practical reference for the applications configured in this repository. It describes
**the repository configuration after activation**, not necessarily the currently running
session. Application defaults may change with updates; local UI preferences and extensions
can also override them.

## Notation and scope

- `Super` is the Windows/Meta key (`Mod` in the niri configuration).
- `Ctrl+Shift+C` means press the keys together.
- `Space f f` means press the keys **in sequence**. Neovim's `<leader>` is already `Space`.
- Capital letters in sequences require Shift: `Space g B` is different from `Space g b`.
- **G** below means press `Ctrl+Shift+Space`, release it, then press the following key.
  This prefix belongs to Ghostty, not Neovim or Pi.
- Neovim mappings are Normal-mode mappings unless another mode is stated.
- Configured bindings are documented separately from unchanged application defaults.
- Desktop applications and niri are configured on `ideapad`. Neovim, Pi and Nushell are
  also configured on `homelab`.

### Key ownership

| Layer | Convention |
|---|---|
| niri | `Super+…` controls the desktop |
| Ghostty | **G**, then a key, handles conflict-prone terminal actions |
| Neovim | `Space` groups plugin commands; standard editing keys stay unchanged |
| Pi | Default Pi shortcuts; use `/hotkeys` for the active bindings |

Ghostty receives keyboard input before its terminal applications. Its old direct bindings
for `Ctrl+-`, `Ctrl+Shift+P/F/O` and `Ctrl+PageUp/PageDown` have been removed so those keys
can reach Pi and Neovim. Clipboard shortcuts remain `Ctrl+Shift+C/V`.

## Contents

- [niri](#niri)
- [Ghostty](#ghostty)
- [Neovim / NVF](#neovim--nvf)
- [Pi](#pi)
- [Yazi](#yazi)
- [btop](#btop)
- [Lazygit](#lazygit)
- [Lazydocker](#lazydocker)
- [Nushell](#nushell)
- [mpv](#mpv)
- [imv](#imv)
- [Zathura](#zathura)
- [Zen Browser](#zen-browser)
- [Thunderbird](#thunderbird)
- [Sources and maintenance](#sources-and-maintenance)

## niri

**Configured:** [desktop bindings](home-manager/common/desktop/niri/niri/binds.nix).

### Launchers and session

| Keys | Action |
|---|---|
| `Super+Space` | Toggle the application launcher |
| `Super+Enter` or `Super+T` | Open the default terminal |
| `Super+E` | Open the default text editor |
| `Super+P` | Toggle the clipboard manager |
| `Super+Alt+L` | Lock the session |
| `Super+X` | Toggle the power/session menu |
| `Super+Escape` | Toggle the window overview |
| `Super+Shift+O` | Show the desktop hotkey overlay |
| `Super+Q` | Close the focused window |
| `Print` | Take a full-screen screenshot |
| `Super+Shift+S` | Take a region screenshot |

### Focus, movement and workspaces

`H/J/K/L` correspond to left/down/up/right. Arrow keys provide the same directional actions.

| Keys | Action |
|---|---|
| `Super+H/J/K/L` | Focus the column/window in that direction |
| `Super+Shift+H/J/K/L` | Move the column/window in that direction |
| `Super+Ctrl+H/J/K/L` | Focus the monitor in that direction |
| `Super+Ctrl+Shift+H/J/K/L` | Move the window to that monitor |
| `Super+Tab` | Focus the next window, or the column to the right |
| `Super+Shift+Tab` | Focus the previous window, or the column to the left |
| `Super+Home` / `Super+End` | Focus the first/last column |
| `Super+Shift+Home` / `Super+Shift+End` | Move the column to the first/last position |
| `Super+1…7`, `Super+9` | Focus that workspace |
| `Super+Shift+1…9` | Move the window to that workspace |

There is currently **no `Super+8` workspace-focus binding**, even though `Super+Shift+8`
is configured. The table intentionally reflects that difference.

### Layout

| Keys | Action |
|---|---|
| `Super+R` | Cycle preset column widths |
| `Super+F` | Maximize the column |
| `Super+Shift+F` | Toggle window fullscreen |
| `Super+C` | Center the column |
| `Super+V` | Switch focus between floating and tiling windows |
| `Super+Shift+V` | Toggle floating for the focused window |
| `Super+-` / `Super+=` | Decrease/increase column width by 10% |
| `Super+Shift+-` / `Super+Shift+=` | Decrease/increase window height by 10% |

Hardware volume, microphone-mute and brightness keys are configured too. Media keys
control playback through `playerctl`.

## Ghostty

**Configured prefix:** [Ghostty configuration](home-manager/common/ghostty/default.nix).

Press **G** (`Ctrl+Shift+Space`), release it, then press the listed key:

| Sequence | Action |
|---|---|
| **G**, `p` | Open the command palette |
| **G**, `f` | Search terminal output |
| **G**, `o` | Create a split to the right |
| **G**, `[` / `]` | Previous/next terminal tab |
| **G**, `-` / `=` | Decrease/increase font size |

The prefix has no timeout. Press the second key immediately; avoid using the prefix as
a standalone shortcut. An unbound continuation may be forwarded to the terminal application.

### Retained defaults

| Keys | Action |
|---|---|
| `Ctrl+Shift+C` / `Ctrl+Shift+V` | Copy selection / paste clipboard text |
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+N` | New window |
| `Ctrl+Shift+W` | Close the current tab |
| `Ctrl+Shift+Q` | Quit Ghostty |
| `Ctrl+Tab` / `Ctrl+Shift+Tab` | Next/previous tab |
| `Alt+1…8` | Select a tab by index |
| `Alt+9` | Select the last tab |
| `Ctrl+Shift+E` | Create a split below |
| `Ctrl+Alt+Arrow` | Focus a terminal split |
| `Ctrl+Shift+Enter` | Toggle zoom for the current split |
| `Ctrl+Enter` | Toggle terminal fullscreen |
| `Ctrl+=` or `Ctrl++` | Increase font size (also available through **G**) |
| `Ctrl+0` | Reset font size |
| `Shift+PageUp` / `Shift+PageDown` | Scroll terminal history |
| `Ctrl+Shift+,` | Reload Ghostty configuration |
| `Ctrl+,` | Open Ghostty configuration |

Use `ghostty +list-keybinds` to inspect active bindings. In full-screen TUI applications,
prefer the application's own scrolling and search controls.

## Neovim / NVF

**Configured changes:** [keymaps](home-manager/common/editors/nvf/keymaps.nix) and
[Pi plugin setup](home-manager/common/editors/nvf/lazy.nix).
**Unchanged NVF defaults:** [editor configuration](home-manager/common/editors/nvf/default.nix)
and [language configuration](home-manager/common/editors/nvf/languages.nix).

### Basic editing — standard Neovim

| Keys | Action |
|---|---|
| `i` / `a` | Enter Insert mode before/after the cursor |
| `Escape` | Return to Normal mode |
| `h/j/k/l` | Move left/down/up/right |
| `w` / `b` | Next/previous word |
| `gg` / `G` | First/last line |
| `0` / `$` | Beginning/end of the line |
| `v` / `V` / `Ctrl+V` | Characterwise/linewise/blockwise Visual mode |
| `y` / `d` / `c` with a motion or selection | Yank/delete/change text |
| `yy` / `dd` | Yank/delete the current line |
| `p` / `P` | Paste after/before the cursor |
| `u` / `Ctrl+R` | Undo/redo |
| `/` / `?`, then `Enter` | Search forward/backward |
| `n` / `N` | Next/previous search match |
| `:w` / `:q` / `:wq`, then `Enter` | Save/quit/save and quit |

The default clipboard register is `unnamedplus`, so normal yanks and puts use the system
clipboard. Commands such as `:q` and `:bdelete` refuse to discard unsaved changes.

### Windows and completion — unchanged defaults

| Keys | Mode/context | Action |
|---|---|---|
| `Ctrl+h/j/k/l` | Normal | Focus the adjacent Neovim split |
| `Alt+h/j/k/l` | Normal | Resize a Neovim split |
| `Ctrl+\` | Normal | Focus the previous split (Smart Splits) |
| `Space Space h/j/k/l` | Normal | Swap buffers with the adjacent split |
| `Ctrl+w`, then `s` / `v` | Normal | Horizontal/vertical Neovim split |
| `Ctrl+w`, then `q` | Normal | Close the current Neovim window |
| `Ctrl+Space` | Insert | Open the completion menu |
| `Tab` / `Shift+Tab` | Completion menu | Next/previous completion item |
| `Enter` | Completion menu | Confirm completion |
| `Ctrl+E` | Insert/completion | Close the completion menu |
| `Ctrl+D` / `Ctrl+F` | Completion documentation | Scroll documentation up/down |
| `Ctrl+\`, then `Ctrl+N` | Terminal mode | Leave terminal-input mode |

Ghostty splits and Neovim splits are separate. `Ctrl+Alt+Arrow` controls Ghostty;
`Ctrl+h/j/k/l` controls Neovim. Completion keys are contextual, not global editing shortcuts.

### Files and search — unchanged Telescope defaults

| Sequence | Action |
|---|---|
| `Space f f` | Find files |
| `Space f g` | Live grep |
| `Space f h` | Search help tags |
| `Space f t` | Open the Telescope builtin picker |
| `Space f r` | Resume the previous picker |
| `Space f l d` | Search diagnostics |
| `Space f l r` | Search LSP references |
| `Space f l D` | Search LSP definitions |
| `Space f l i` | Search LSP implementations |
| `Space f l t` | Search LSP type definitions |
| `Space f l s b` / `Space f l s w` | Document/workspace symbol picker |

### Buffers — configured

| Sequence | Action |
|---|---|
| `Space b b` | Open the buffer picker |
| `Space b n` / `Space b p` | Next/previous buffer |
| `Space b d` | Delete the current buffer without forcing unsaved changes |

### LSP — unchanged NVF defaults

These mappings become available in buffers with an attached language server.

| Sequence | Action |
|---|---|
| `Space l a` | Code action |
| `Space l f` | Format the buffer |
| `Space l n` | Rename symbol |
| `Space l h` | Hover documentation |
| `Space l s` | Signature help |
| `Space l g d` / `Space l g D` | Go to definition/declaration |
| `Space l g t` | Go to type definition |
| `Space l g i` / `Space l g r` | List implementations/references |
| `Space l g n` / `Space l g p` | Next/previous diagnostic |
| `Space l e` | Open diagnostic details |
| `Space l t f` | Toggle format-on-save for the buffer |
| `Space l w a` / `Space l w r` | Add/remove a workspace folder |
| `Space l w l` | List workspace folders |

### Git — configured

| Sequence | Action |
|---|---|
| `Space g f` | Git file picker |
| `Space g s` | Git status picker |
| `Space g B` | Branch picker |
| `Space g c` / `Space g C` | Repository/current-buffer commit picker |
| `Space g x` | Stash picker |
| `Space g h s` / `Space g h u` | Stage hunk / undo staging the hunk |
| `Space g h S` | Stage the buffer |
| `Space g h r` / `Space g h R` | Reset the hunk/buffer; discards changes |
| `Space g h P` | Preview the hunk |
| `Space g h b` | Blame the current line |
| `Space g h d` | Diff the current buffer against the index |
| `Space g h D` | Diff the current buffer against the previous revision (`~`) |
| `Space g t b` / `Space g t d` | Toggle inline blame / deleted-line display |
| `]c` / `[c` | Next/previous hunk (unchanged Gitsigns defaults) |

### Debugging — unchanged NVF DAP defaults

Debugging support is enabled. These commands require an available debug adapter and a
suitable launch configuration for the current language/project.

| Sequence | Action |
|---|---|
| `Space d b` | Toggle a breakpoint |
| `Space d c` | Start/continue debugging |
| `Space d R` | Restart the debug session |
| `Space d q` | Terminate the debug session |
| `Space d g i` / `Space d g j` / `Space d g o` | Step into/over/out |
| `Space d g c` | Run to the cursor |
| `Space d r` | Toggle the debugger REPL |
| `Space d h` | Inspect the value under the cursor |

### Yazi and Pi — configured

| Sequence | Mode | Action |
|---|---|---|
| `Space e e` | Normal | Open Yazi at the current file |
| `Space e d` | Normal | Open Yazi in Neovim's working directory |
| `Space e r` | Normal | Resume the last Yazi session |
| `Space p p` | Normal/Visual | Open the Pi send dialog; Visual mode includes the selection |
| `Space p f` | Normal | Send the current file to Pi with a prompt |
| `Space p b` | Normal | Send the whole buffer to Pi with a prompt |
| `Space p s` | Visual | Send the selection to Pi with a prompt |
| `Space p i` | Normal | Ping the running Pi session |

The old automatic `Space p` action is disabled so it cannot shadow the `Space p …` group.
The Pi bridge expects a running Pi session; it does not start a new Pi terminal by itself.
`which-key` is enabled: pause after a leader prefix to see available mappings.

## Pi

**Defaults:** no custom `keybindings.json` is declared by this repository.
[Pi configuration](home-manager/common/editors/pi/default.nix) enables the application and
extensions. The following are Linux defaults; `/hotkeys` is authoritative for the active session.

### Main editor and application

| Keys | Action |
|---|---|
| `Enter` | Submit the prompt |
| `Shift+Enter` or `Ctrl+J` | Insert a newline |
| `Escape` | Interrupt/abort the current operation |
| `Ctrl+C` | Clear input; pressing again with empty input exits |
| `Ctrl+D` | Exit when the editor is empty |
| `Ctrl+Z` | Suspend Pi; use `fg` in the shell to resume |
| `Ctrl+G` | Open the prompt in the external editor (Neovim here) |
| `Ctrl+V` | Paste an image or text from the clipboard |
| `Ctrl+L` | Select a model |
| `Ctrl+P` / `Ctrl+Shift+P` | Cycle models forward/backward |
| `Shift+Tab` | Cycle thinking level |
| `Ctrl+T` | Toggle thinking-block visibility |
| `Ctrl+O` | Expand/collapse tool output |
| `Ctrl+X` | Copy the last assistant message (context-dependent) |
| `Alt+Enter` | Queue a follow-up message |
| `Alt+Up` | Restore queued messages to the editor |
| `Ctrl+A` / `Ctrl+E` | Beginning/end of the input line |
| `Ctrl+Left` / `Ctrl+Right` | Move by word |
| `Ctrl+W` | Delete the previous word |
| `Ctrl+U` / `Ctrl+K` | Delete to beginning/end of the line |
| `Ctrl+-` | Undo input editing |

`Ctrl+Shift+V` is Ghostty's text paste. Use Pi's `Ctrl+V` for image clipboard handling.
Selectors and dialogs reuse several keys; their on-screen hints take precedence.

### Full-screen transcript

| Keys | Action |
|---|---|
| `PageUp` / `PageDown` | Scroll the transcript |
| `Ctrl+Up` / `Ctrl+Down` | Previous/next marked message |
| `Ctrl+Home` / `Ctrl+End` | Transcript beginning/end |
| `Ctrl+Shift+F` | Search the transcript |
| `Enter` / `Shift+Enter` | Next/previous search result while searching |
| `Escape` | Close transcript search |

### Useful commands

| Command | Action |
|---|---|
| `/hotkeys` | Inspect current keybindings |
| `/settings` | Open settings |
| `/new` | Start a new session |
| `/tree` | Navigate the session tree |
| `/resume` | Pick a previous session |
| `/reload` | Reload configuration and resources |

## Yazi

**Configured:** [Yazi](home-manager/common/media/yazi.nix). The wrapper command is `y`;
when launched from Nushell it can change the shell's working directory after exit.
The table mixes manager-view defaults with explicitly configured plugin bindings.

| Keys | Action |
|---|---|
| `j` / `k` or `Down` / `Up` | Next/previous file |
| `h` | Parent directory |
| `l` | Enter a directory or open a file via smart-enter; configured |
| `H` / `L` | Back/forward through directory history |
| `gg` / `G` | First/last file |
| `Enter` or `o` | Open selected files using an opener |
| `Space` | Toggle file selection and advance |
| `v` | Enter visual selection mode |
| `Escape` | Leave a mode or clear selection |
| `y` / `x` | Copy/cut selected files |
| `p` | Paste into the hovered directory, or the current directory when hovering a file, via smart-paste; configured |
| `a` | Create a file; end the name with `/` for a directory |
| `r` | Rename |
| `d` | Move selected files to trash |
| `D` | Permanently delete selected files; destructive |
| `.` | Toggle hidden files (shown by default here) |
| `/` / `?` | Find the next/previous matching filename |
| `n` / `N` | Next/previous find result |
| `f`, then a character | Jump to a filename starting with that character via jump-to-char; configured |
| `F` | Smart filename filtering via smart-filter; configured |
| `Tab` | Inspect the hovered file in spot view |
| `Ctrl+N` | Open ripdrag for dragging selected files to another application; configured |
| `~` or `F1` | Show context-sensitive help |
| `q` | Quit |

Yazi mouse events do not themselves provide desktop drag-and-drop. `Ctrl+N` opens the
separate ripdrag window; drag from that window into the target application.

Startup setup enables the Starship header, Git file-status signs and `no-status`, which
hides the bottom status bar. MIME detection uses mime-ext fetchers; piper handles the
configured Markdown, JSON and archive previews. The obsolete `term-cwd` entry is removed.

## btop

**Configured:** [btop](home-manager/common/dev/btop.nix), with `vim_keys = true`.
Help is therefore **`H`**, and kill is **`K`**, not lowercase `h`/`k`.

| Keys | Context | Action |
|---|---|---|
| `j` / `k` or `Down` / `Up` | Process list | Next/previous process |
| `g` / `G` | Process list | First/last process |
| `h` / `l` or `Left` / `Right` | Process list | Previous/next sorting field |
| `r` | Process list | Reverse sorting |
| `H`, `?` or `F1` | Main view | Help |
| `o` or `F2` | Main view | Options |
| `m` or `Escape` | Main view | Main menu |
| `1` / `2` / `3` / `4` | Main view | Toggle CPU/memory/network/process boxes |
| `K` | Selected process | Open the kill-signal action; destructive |
| `q` | Main view, outside text filtering | Quit |

Text-entry and menu contexts handle keys differently. Check the help overlay before
sending a signal to a process; killing a process may lose unsaved work.

## Lazygit

**Defaults:** [configuration](home-manager/common/dev/lazygit.nix) changes the diff renderer,
not keybindings. Keys are context-sensitive; the same letter can mean something different
in another panel.

| Keys | Context | Action |
|---|---|---|
| `?` | Main UI | Open the keybindings menu |
| `q` or `Ctrl+C` | Main UI | Quit |
| `R` | Main UI | Refresh local Git state; does not fetch |
| `p` / `P` | Main UI | Pull/push the current branch |
| `Space` | Files panel | Stage/unstage the selected file |
| `a` | Files panel | Stage/unstage all files |
| `Enter` | Files panel | Focus a file's diff/staging view, or expand/collapse a directory |
| `c` | Files/diff panel | Commit staged changes |
| `C` | Files panel | Commit using the external editor |
| `s` | Files panel | Stash changes |
| `f` | Files panel | Fetch from the remote |
| `/` | Files panel | Filter the current view by text |
| `d` | Files panel | Open discard options; can destroy changes |
| `Space` | Diff/staging view | Stage/unstage the selected lines or hunk |
| `Escape` | Diff/staging view | Return to the side panel |

Do not confuse lowercase `p` (pull) with uppercase `P` (push), or a Git discard action
with merely closing a panel.

## Lazydocker

**Defaults:** [configuration](home-manager/common/dev/lazydocker.nix) changes appearance
and graphs, not keybindings. Operations apply to the currently selected Docker resource.

| Keys | Context | Action |
|---|---|---|
| `x` or `?` | Main UI | Open the options/keybindings menu |
| `q` or `Ctrl+C` | Main UI | Quit; `q` closes an open menu first |
| `Escape` | Menu/popup | Back/close |
| `1…6` | Main UI | Focus projects/services/containers/images/volumes/networks |
| `+` / `_` | Main UI | Next/previous screen mode |
| `Enter` | Resource panel | Focus the main detail panel |
| `[` / `]` | Resource panel | Previous/next detail tab |
| `/` | Resource list | Filter the list |
| `m` | Containers panel | View logs |
| `E` | Containers panel | Execute a shell in the container |
| `a` | Containers panel | Attach to the container |
| `r` | Containers panel | Restart the container |
| `s` | Containers panel | Stop the container |
| `p` | Containers panel | Pause the container |
| `d` | Containers panel | Remove the container; destructive |

This is the local Docker client, not the Podman container configuration used by the homelab
services. Restart, stop and removal actions can interrupt workloads.

## Nushell

**Configured:** [Nushell](home-manager/common/shells/nushell.nix) uses `edit_mode = "vi"`.
These are command-line editing modes, independent of Neovim's modes.

| Keys | Context | Action |
|---|---|---|
| `Escape` | Insert mode | Switch to Vi normal mode |
| `i` / `a` | Vi normal mode | Insert before/after the cursor |
| `h` / `l`, `w` / `b` | Vi normal mode | Move by character/word |
| `Enter` | Command line | Execute the command |
| `Shift+Enter` or `Alt+Enter` | Vi insert mode | Insert a newline |
| `Ctrl+R` | Vi insert/normal mode | Search command history |
| `Ctrl+C` | Command line | Cancel the current input |

Use `keybindings default` inside Nushell to inspect Reedline's default mappings. The
repository declares no custom Nushell keybinding list.

## mpv

**Defaults:** [mpv](home-manager/common/media/mpv.nix) has no custom input bindings.

| Keys | Action |
|---|---|
| `Space` or `p` | Pause/resume |
| `Left` / `Right` | Seek backward/forward about 5 seconds |
| `Down` / `Up` | Seek backward/forward about 60 seconds |
| `Shift+Left` / `Shift+Right` | Seek backward/forward exactly 1 second |
| `9` / `0` | Decrease/increase volume |
| `m` | Toggle mute |
| `f` | Toggle fullscreen |
| `[` / `]` | Decrease/increase playback speed |
| `Backspace` | Reset playback speed |
| `s` | Save a video screenshot with subtitles |
| `q` | Quit |
| `Q` | Quit and remember the playback position |

## imv

**Defaults:** [imv](home-manager/common/media/imv.nix) does not override keybindings.

| Keys | Action |
|---|---|
| `Left` / `Right` or `[` / `]` | Previous/next image |
| `gg` / `G` | First/last image |
| `Up` / `Down` or `i` / `o` | Zoom in/out |
| `a` | Actual-size zoom |
| `c` | Center the image |
| `s` | Cycle scaling mode |
| `r` | Reset view |
| `d` | Toggle the information overlay |
| `f` | Toggle fullscreen |
| `q` | Quit |

## Zathura

**Defaults:** [Zathura](home-manager/common/media/zathura.nix) changes appearance and
scrolling options, not keybindings.

| Keys | Action |
|---|---|
| `h/j/k/l` or arrow keys | Scroll |
| `J` / `K` or `PageDown` / `PageUp` | Next/previous page |
| `gg` / `G` | First/last page |
| `/` / `?` | Search forward/backward |
| `n` / `N` | Next/previous search result |
| `a` / `s` | Best-fit / fit-to-width |
| `+` / `-` / `=` | Zoom in/out/reset |
| `Tab` | Toggle the document index |
| `f` | Follow a link |
| `r` | Rotate by 90 degrees |
| `Ctrl+R` | Toggle recoloring/inversion |
| `F11` | Toggle fullscreen |
| `q` | Quit |

## Zen Browser

**Defaults:** the repository configures [Zen](home-manager/common/zen.nix) and
[the profile](home-manager/bagoont/browser-zen.nix), but does not declare keyboard overrides.
These are core Linux browser shortcuts; user-customized Zen shortcuts may differ.

| Keys | Action |
|---|---|
| `Ctrl+L` or `Alt+D` | Focus the address bar |
| `Ctrl+T` | New tab |
| `Ctrl+W` | Close the current tab |
| `Ctrl+S` | Save the page |
| `Ctrl+P` | Print the page |
| `Ctrl+B` | Toggle the bookmarks sidebar |
| `Ctrl+Shift+A` | Open add-ons |
| `Ctrl+Shift+I` | Toggle developer tools |
| `F11` | Toggle fullscreen |
| `Escape` | Stop loading |

Zen's own Keyboard Shortcuts settings are the authoritative reference for customized
browser actions, spaces and split views.

## Thunderbird

**Defaults:** [Thunderbird](home-manager/common/apps/thunderbird.nix) is enabled without
keyboard overrides. Shortcuts depend on whether the message list or compose window is focused.

| Keys | Context | Action |
|---|---|---|
| `Ctrl+N` | Main window | Compose a new message |
| `Ctrl+R` | Selected/open message | Reply to sender |
| `Ctrl+Shift+R` | Selected/open message | Reply to all |
| `F8` | Main window | Toggle the message pane |
| `F9` | Compose window | Toggle the contacts sidebar |

## Sources and maintenance

Configured bindings are defined in the linked Nix files above. Neovim's unchanged plugin
bindings were checked against the evaluated NVF configuration; Pi bindings against its
installed keybindings reference. Core Neovim editing commands are standard defaults.

Additional default references:

- [Ghostty keybindings](https://ghostty.org/docs/config/keybind) and
  [trigger sequences](https://ghostty.org/docs/config/keybind/sequence).
- [Yazi default keymap](https://github.com/sxyazi/yazi/blob/main/yazi-config/preset/keymap-default.toml).
- [btop 1.4.7 input handling](https://github.com/aristocratos/btop/blob/v1.4.7/src/btop_input.cpp).
- [Lazygit 0.66.1 keys](https://github.com/jesseduffield/lazygit/blob/v0.66.1/docs-master/keybindings/Keybindings_en.md).
- [Lazydocker 0.25.2 keys](https://github.com/jesseduffield/lazydocker/blob/v0.25.2/docs/keybindings/Keybindings_en.md)
  and [global handlers](https://github.com/jesseduffield/lazydocker/blob/v0.25.2/pkg/gui/keybindings.go).
- [Nushell line editor](https://www.nushell.sh/book/line_editor.html).
- [mpv default input configuration](https://github.com/mpv-player/mpv/blob/master/etc/input.conf).
- [imv default configuration](https://github.com/eXeC64/imv/blob/master/files/imv_config).
- [Zathura controls](https://pwmt.org/projects/zathura/documentation/).
- [Zen shortcuts](https://docs.zen-browser.app/user-manual/shortcuts).
- [Thunderbird shortcuts](https://support.mozilla.org/en-US/kb/keyboard-shortcuts-thunderbird).

This is a daily-use reference, not an exhaustive mapping dump. After changing a binding,
update this file alongside the corresponding Nix module. Use in-application help for
context-specific dialogs and less common commands.
