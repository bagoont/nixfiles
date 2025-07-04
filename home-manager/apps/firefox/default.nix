{
  inputs,
  pkgs,
  config,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
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
          nighttab
          ff2mpv
          ublock-origin
          localcdn
          history-cleaner
          tridactyl
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
        "media.ffmpeg.vaapi.enabled" = true;
        "widget.dmabuf.force-enabled" = true;
        "privacy.webrtc.legacyGlobalIndicator" = false;
        "app.shield.optoutstudies.enabled" = false;
        "app.update.auto" = false;
        "browser.contentblocking.category" = "strict";
        "datareporting.policy.dataSubmissionEnable" = false;
        "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "signon.rememberSignons" = false;
      };
    };
  };

  home.file.".mozilla/firefox/${config.programs.firefox.profiles.Default.path}/user.js".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
    hash = "sha256-As15gMIT8venJDL1xif11meV9kuzokZkJVSWIS6eJh8=";
  };
}
