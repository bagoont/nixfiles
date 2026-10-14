{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.zen-browser.profiles."default" = let
    containers = config.programs.zen-browser.profiles."default".containers;
    spaces = config.programs.zen-browser.profiles."default".spaces;
    pins = config.programs.zen-browser.profiles."default".pins;
  in {
    isDefault = true;
    containersForce = true;
    spacesForce = true;
    containers = {
      "Личное" = {
        color = "blue";
        icon = "fingerprint";
        id = 1;
      };
      "Работа" = {
        color = "yellow";
        icon = "briefcase";
        id = 2;
      };
      "Покупки" = {
        color = "green";
        icon = "dollar";
        id = 3;
      };
    };
    spaces = {
      "Основное" = {
        id = "c6de089c-410d-4206-961d-ab11f988d40a";
        container = containers."Личное".id;
        position = 1000;
      };
      "Работа" = {
        id = "cdd10fab-4fc5-494b-9041-325e5759195b";
        icon = "💼";
        container = containers."Работа".id;
        position = 2000;
      };
      "Покупки" = {
        id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc24";
        icon = "🛒";
        container = containers."Покупки".id;
        position = 3000;
      };
    };
    pins = {
      # Основное
      "YouTube" = {
        id = "9d8a8f91-7e29-4688-ae2e-da4e49d4a179";
        container = containers."Личное".id;
        url = "https://youtube.com/";
        isEssential = true;
        position = 101;
      };
      "GitHub" = {
        id = "8af62707-0722-4049-9801-bedced343333";
        container = containers."Личное".id;
        url = "https://github.com";
        isEssential = true;
        position = 102;
      };
      "Habr" = {
        id = "fb316d70-2b5e-4c46-bf42-f4e82d635153";
        container = containers."Личное".id;
        url = "https://habr.com/";
        isEssential = true;
        position = 103;
      };
      "Bagoont" = {
        id = "d85a9026-1458-4db6-b115-346746bcc692";
        workspace = spaces."Основное".id;
        isGroup = true;
        isFolderCollapsed = false;
        editedTitle = true;
        position = 200;
      };
      "Opencloud" = {
        id = "f8dd784e-11d7-430a-8f57-7b05ecdb4c77";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://cloud.bagoont.ru";
        position = 201;
      };
      "Forgejo" = {
        id = "92931d60-fd40-4707-9512-a57b1a6a3919";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://git.bagoont.ru";
        position = 202;
      };
      "Vaultwarden" = {
        id = "2eed5614-3896-41a1-9d0a-a3283985359b";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://pass.bagoont.ru";
        position = 203;
      };
      "Pangolin" = {
        id = "953efa42-8014-46b8-9e61-0ff0fc9f9c1d";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://pangolin.bagoont.ru";
        position = 204;
      };
      "Authelia" = {
        id = "b4f654a4-03e3-47f5-85c8-05840bd5f872";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://auth.bagoont.ru";
        position = 205;
      };
      "Open WebUI" = {
        id = "6ff7bc53-29d6-4a32-9620-a45a16155cb5";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://ai.internal";
        position = 206;
      };
      "Jellyfin" = {
        id = "f9adc558-6276-4467-bc99-70398d53ae99";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://media.bagoont.ru";
        position = 207;
      };
      "qBittorrent" = {
        id = "d7f171da-4be5-4391-9498-a62f13dda0ab";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://torrent.internal";
        position = 208;
      };
      "Proxmox" = {
        id = "56079e74-c2c9-4fe2-8b49-21dfbdf7fd66";
        workspace = spaces."Основное".id;
        folderParentId = pins."Bagoont".id;
        url = "https://proxmox.internal";
        position = 209;
      };

      # Покупки
      "Ozon" = {
        id = "989dcecd-9e95-41b7-9615-b75bb9a2e6d9";
        container = containers."Покупки".id;
        url = "https://www.ozon.ru";
        isEssential = true;
        position = 121;
      };
      "Wildberries" = {
        id = "e951bcb1-e612-4ec4-862a-58543557a5db";
        container = containers."Покупки".id;
        url = "https://www.wildberries.ru";
        isEssential = true;
        position = 122;
      };
      "Яндекс Маркет" = {
        id = "9b235fe4-9a15-43aa-b216-6501d8ae3d21";
        container = containers."Покупки".id;
        url = "https://market.yandex.ru";
        isEssential = true;
        position = 123;
      };
      "Aliexpress" = {
        id = "b659b011-585b-4703-97a0-229fa80e8aec";
        container = containers."Покупки".id;
        url = "https://aliexpress.ru";
        isEssential = true;
        position = 124;
      };
      "Avito" = {
        id = "14b47d20-155c-41c1-8dfe-3bbf95b85d03";
        container = containers."Покупки".id;
        url = "https://www.avito.ru";
        isEssential = true;
        position = 125;
      };
      "Plati Market" = {
        id = "4e0cc47f-0e88-4343-8cee-76d0758138a7";
        container = containers."Покупки".id;
        url = "https://plati.market";
        isEssential = true;
        position = 126;
      };
    };
    extensions = {
      packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        history-cleaner
        ublock-origin
        bitwarden
        metamask
        ff2mpv
      ];
    };
    search = {
      force = true;
      default = "ddg";
      engines = {
        "Nix Packages" = {
          name = "NixOS";
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };
        "Nix Options" = {
          urls = [
            {
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@no"];
        };
      };
    };
    settings = {
      browser = {
        contentblocking.category = "strict";
        download.start_downloads_in_tmp_dir = true;
        cache.disk.enable = false;
        sessionstore.interval = 60000;
        search.suggest.enabled = false;
        urlbar.speculativeConnect.enabled = false;
        urlbar.groupLabels.enabled = false;
        places.speculativeConnect.enabled = false;
        shell.checkDefaultBrowser = false;
        startup.homepage_override.mstone = "ignore";
        aboutwelcome.enabled = false;
        privateWindowSeparation.enabled = false;
        newtabpage.activity-stream = {
          default.sites = "";
          showSponsoredTopSites = false;
          feeds.section.topstories = false;
          showSponsoredCheckboxes = false;
        };
        privatebrowsing.resetPBM.enabled = true;
        search.update = false;
        privacy.history.custom = true;
        security.csp.reporting.enabled = false;
        media.memory_cache_max_size = 65536;
        network = {
          http.speculative-parallel-limit = 0;
          prefetch-next = false;
        };
        dom.security = {
          https_only_mode = true;
          https_only_mode_error_page_user_suggestions = true;
        };
        signon = {
          formlessCapture.enabled = false;
          privateBrowsingCapture.enabled = false;
        };
        extensions = {
          enabledScopes = 5;
          getAddons.cache.enabled = false;
        };
        permissions = {
          default.desktop-notification = 2;
          manager.defaultsUrl = "";
        };
        "full-screen-api" = {
          "transition-duration".enter = "0 0";
          "transition-duration".leave = "0 0";
          warning.timeout = 0;
        };
      };
    };
  };
}
