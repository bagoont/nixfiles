{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "noctalia";
      app-notifications = "no-clipboard-copy,no-config-reload";
      font-size = 11;
      window-padding-x = "25";
      window-padding-y = "10";
      confirm-close-surface = false;
      shell-integration-features = "cursor,sudo,title,ssh-env,ssh-terminfo";
      quick-terminal-animation-duration = 0.08;
      keybind = [
        "ctrl+-=unbind"
        "ctrl+shift+p=unbind"
        "ctrl+shift+f=unbind"
        "ctrl+shift+o=unbind"
        "ctrl+page_up=unbind"
        "ctrl+page_down=unbind"

        "ctrl+shift+space>p=toggle_command_palette"
        "ctrl+shift+space>f=start_search"
        "ctrl+shift+space>o=new_split:right"
        "ctrl+shift+space>[=previous_tab"
        "ctrl+shift+space>]=next_tab"
        "ctrl+shift+space>-=decrease_font_size:1"
        "ctrl+shift+space>==increase_font_size:1"
      ];
    };
  };
}
