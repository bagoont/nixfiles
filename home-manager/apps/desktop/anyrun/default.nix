{
  inputs,
  pkgs,
  ...
}: {
  programs.anyrun = {
    enable = true;
    package = pkgs.anyrun;
    config = {
      x.fraction = 0.5;
      y.fraction = 0.25;
      width.fraction = 0.3;
      hideIcons = false;
      ignoreExclusiveZones = true;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
      showResultsImmediately = false;
      maxEntries = null;
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        websearch
        rink
      ];
    };

    extraCss = builtins.readFile (./. + "/style-dark.css");

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
          terminal: Some(Terminal(
            command: "ghostty",
            args: "-e {}",
          )),
        )
      '';

      "websearch.ron".text = ''
        Config(
          prefix: "?",
          engines: [DuckDuckGo]
        )
      '';
    };
  };
}
