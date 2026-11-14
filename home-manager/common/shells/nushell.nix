{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    loadSessionVariables = false;
    plugins = with pkgs.nushellPlugins; [
      gstat
      query
      formats
    ];
    shellAliases = {
      sshon = "sudo systemctl start sshd.service";
      sshoff = "sudo systemctl stop sshd.service";
    };
    environmentVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    settings = {
      show_banner = false;
      edit_mode = "vi";
      table.mode = "compact";

      completions = {
        case_sensitive = false;
        quick = true;
        partial = true;
        algorithm = "prefix";
      };
    };
  };
}
