{
  programs.lazydocker = {
    enable = true;

    settings = {
      gui = {
        theme = {
          activeBorderColor = ["green" "bold"];
          inactiveBorderColor = ["white"];
        };
        showGraphs = true;
      };
    };
  };
}
