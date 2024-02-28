{ config, lib, pkgs, theme, ... }: {

  # programs.firefox.arkenfox.enable = true;
  # programs.firefox.arkenfox.version = "122.0";

  # xdg.configFile."firefox/treestyle-tab.json".source = ./firefox/config.json;
  programs.firefox = {
    enable = true;

    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
          Search = true;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    profiles.Default = {
      # arkenfox = {
      #   enable = true;
      #   # "0800"."0804"."browser.search.suggest.enabled".value = true;
      #   "2800"."2811"."privacy.cpd.history".value = false;
      #   "2800"."2820"."privacy.clearOnShutdown.history".value = false;
      #   "5000"."5001"."browser.privatebrowsing.autostart".value = false;
      #   "5000"."5013"."places.history.enabled".value = true;
      #   "5000"."5021"."keyword.enabled".value = true;
      # };
      search = {
        force = true;
        default = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [{
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
            }];
            icon =
              "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "NixOS Wiki" = {
            urls = [{
              template = "https://nixos.wiki/index.php?search={searchTerms}";
            }];
            iconUpdateURL = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "@nw" ];
          };
          "Wikipedia (en)".metaData.alias = "@wiki";
        };
      };
      extensions = with config.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        tree-style-tab
        tst-tab-search
        auto-tab-discard
        darkreader
        skip-redirect
        noscript
        pywalfox
        tab-session-manager
        violentmonkey
      ];

      settings = {
        "General.smoothScroll" = true;
        "media.autoplay.enabled.user-gestures-needed" = false;
        "ui.systemUsesDarkTheme" = 1;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "full-screen-api.ignore-widgets" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.rdd-vpx.enabled" = true;
      };
      extraConfig = lib.strings.concatStrings [
        "${builtins.readFile (./firefox/arkenfox.js)}"

        ''
          user_pref("browser.search.suggest.enabled",true);
          user_pref("privacy.cpd.history" , false);
          user_pref("privacy.clearOnShutdown.history" , false);
          user_pref("browser.privatebrowsing.autostart" , false);
          user_pref("places.history.enabled" , true);
          user_pref("keyword.enabled" , true;
        ''
      ];
      userChrome = ''
        #TabsToolbar {
          visibility: collapse;
        }
      '';
      userContent = "";
    };
  };
}
