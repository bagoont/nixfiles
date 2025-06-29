{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = true;

      username = {
        format = "[$user]($style)";
        show_always = true;
      };

      hostname = {
        format = "[@$hostname]($style) ";
        ssh_only = false;
        style = "bold green";
      };

      shlvl = {
        format = "[$shlvl]($style) ";
        style = "bold cyan";
        threshold = 2;
        repeat = true;
        disabled = false;
        symbol = "";
      };

      status = {
        symbol = "✗ ";
        not_found_symbol = "󰍉 Not Found";
        not_executable_symbol = " Can't Execute E";
        sigint_symbol = "󰂭 ";
        signal_symbol = "󱑽";
        success_symbol = "";
        format = "[$symbol](fg:red) ";
        map_symbol = true;
        disabled = false;
      };

      cmd_duration = {
        min_time = 1000;
        format = "[$duration ](fg:yellow)";
      };

      nix_shell = {
        disabled = false;
        format = "[($name \\(develop\\) <- )$symbol]($style) ";
      };
      container = {
        symbol = " ";
        format = "[$symbol ](blue dimmed)";
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
        read_only = " ";
        truncate_to_repo = true;
        truncation_length = 4;
        truncation_symbol = "";
      };

      git_branch = {
        symbol = "";
        style = "";
        format = "[ $symbol $branch](fg:purple)(:$remote_branch) ";
      };

      os = {
        disabled = false;
        format = "$symbol";
      };

      os.symbols = {
        Arch = "[ ](fg:bright-blue)";
        Alpine = "[ ](fg:bright-blue)";
        Debian = "[ ](fg:red)";
        EndeavourOS = "[ ](fg:purple)";
        Fedora = "[ ](fg:blue)";
        NixOS = "[ ](fg:blue)";
        openSUSE = "[ ](fg:green)";
        SUSE = "[ ](fg:green)";
        Ubuntu = "[ ](fg:bright-purple)";
        Macos = "[ ](fg:white)";
      };
      python = {
        symbol = "";
        format = "[$symbol ](yellow)";
      };
      nodejs = {
        symbol = "󰛦";
        format = "[$symbol ](bright-blue)";
      };
      bun = {
        symbol = "󰛦";
        format = "[$symbol ](blue)";
      };
      deno = {
        symbol = "󰛦";
        format = "[$symbol ](blue)";
      };
      lua = {
        symbol = "󰢱";
        format = "[$symbol ](blue)";
      };
      rust = {
        symbol = "";
        format = "[$symbol ](red)";
      };
      java = {
        symbol = "";
        format = "[$symbol ](red)";
      };
      c = {
        symbol = "";
        format = "[$symbol ](blue)";
      };
      golang = {
        symbol = "";
        format = "[$symbol ](blue)";
      };
      dart = {
        symbol = "";
        format = "[$symbol ](blue)";
      };
      elixir = {
        symbol = "";
        format = "[$symbol ](purple)";
      };
    };
  };
}
