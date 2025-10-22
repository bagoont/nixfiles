{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [inputs.zen-browser.homeModules.beta];

  programs.zen-browser = {
    enable = true;
    languagePacks = [
      "ru-RU"
      "en-US"
    ];
    nativeMessagingHosts = with pkgs; [
      ff2mpv-go
    ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
    };
    profiles.Default = {
      bookmarks = {};
      extensions = {
        packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          metamask
          ff2mpv
          ublock-origin
          localcdn
          history-cleaner
          tridactyl
          multi-account-containers
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
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
      };
    };
  };

  home.file = {
    ".zen/${config.programs.zen-browser.profiles.Default.path}/user.js".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
      hash = "sha256-As15gMIT8venJDL1xif11meV9kuzokZkJVSWIS6eJh8=";
    };

    ".zen/${config.programs.zen-browser.profiles.Default.path}/chrome/userChrome.css".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/zen-browser/refs/heads/main/themes/Mocha/Blue/userChrome.css";
      hash = "sha256-NcJq8lHAnTxt6+bR4wz4kUfi5xiLiHnY9PFqFl+7JWk=";
    };
    ".zen/${config.programs.zen-browser.profiles.Default.path}/chrome/userContent.css".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/zen-browser/refs/heads/main/themes/Mocha/Blue/userContent.css";
      hash = "sha256-X+1EODQpILtAbIZOpI8gx6YqxohFc/wLff8A8Cu+OZs=";
    };
    ".zen/${config.programs.zen-browser.profiles.Default.path}/chrome/zen-logo-mocha.svg".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/zen-browser/refs/heads/main/themes/Mocha/Blue/zen-logo-mocha.svg";
      hash = "sha256-tBvov2yGWcUyoLG5hEiGlgc62zGux6CJIR1PSn7NmoM=";
    };
  };
}
