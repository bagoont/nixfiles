{
  inputs,
  pkgs,
  config,
  ...
}: {
  # imports = [inputs.arkenfox.hmModules.default];

  home.packages = with pkgs; [
    firefoxpwa
  ];

  programs.firefox = {
    enable = true;
    languagePacks = [
      "ru-RU"
      "en-US"
    ];
    nativeMessagingHosts = with pkgs; [
      ff2mpv-go
      firefoxpwa
    ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
    };
    # arkenfox.enable = true;
    profiles.Default = {
      bookmarks = {};
      extensions = {
        packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          metamask
          nighttab
          ff2mpv
          ublock-origin
          localcdn
          history-cleaner
          pwas-for-firefox
        ];
      };
      isDefault = true;
      search = {
        force = true;
        default = "ddg";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };
        };
      };
      # arkenfox = {
      #  enable = true;
      #  "0000".enable = true;
      #  "0100" = {
      #    enable = true;
      #    "0102"."browser.startup.page".value = 1;
      #   };
      #   "0200".enable = true;
      #   "0300".enable = true;
      #   "0400".enable = false;
      # "0600" = {
      #   enable = true;
      #   "0610"."browser.send_pings".enable = true;
      #   };
      #   "0700".enable = true;
      #   "0800".enable = true;
      #   "0900".enable = true;
      # "1000" = {
      #   enable = true;
      #   "1001"."browser.cache.disk.enable".enable = true;
      #   "1001"."browser.cache.disk.enable".value = true;
      #    };
      #   "1200".enable = true;
      #  "1700".enable = true;
      #   "2600" = {
      #   enable = true;
      #   "2653".enable = false;
      # };
      #  "2700".enable = true;
      #  "5000" = {
      #    enable = true;
      #    "5003"."signon.rememberSignons".value = false;
      #  };
      #};
    };
  };
}
