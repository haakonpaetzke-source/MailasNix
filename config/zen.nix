{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    setAsDefaultBrowser = true;

    profiles.default = {
      search = {
        force = true;
        default = "ddg";

        engines = {
          "DuckDuckGo" = {
            urls = [
              {
                template = "https://duckduckgo.com/?q={searchTerms}";
              }
            ];

            icon = "https://duckduckgo.com/favicon.ico";
            definedAliases = [ "@ddg" ];
          };
        };
      };

      mods = {
         "BetterUnloadedTabs" = {
           id = "f7c71d9a-bce2-420f-ae44-a64bd92975ab";
         };
         "BetterCtrlTab" = {
           id = "72f8f48d-86b9-4487-acea-eb4977b18f21";
         };
         "BetterUnloadedTabs" = {
           id = "f7c71d9a-bce2-420f-ae44-a64bd92975ab";
         };
         "BetterAudioIndicator" = {
           id = "2317fd93-c3ed-4f37-b55a-304c1816819e";
         };
         "BetterActiveTabs" = {
           id = "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe";
         };
         "MoreColors" = {
           id = "03a8e7ef-cf00-4f41-bf24-a90deeafc9db";
         };
      };
    };

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };
}
