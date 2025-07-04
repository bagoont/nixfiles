{pkgs, ...}: {
  programs.lazydocker = {
    enable = true;
    package = pkgs.lazydocker;
    settings = {
      commandTemplates = {
        dockerCompose = "podman compose";
      };
    };
  };

  home.sessionVariables = {
    DOCKER_HOST = "unix:///run/user/1000/podman/podman.sock";
  };

  home.shellAliases = {
    ld = "lazydocker";
  };
}
