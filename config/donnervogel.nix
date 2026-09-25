{ config, pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;

    languagePacks = [
      "de"
      "en-US"
    ];

    profiles.mai = {
      isDefault = true;

      settings = {
        "mail.spellcheck.inline" = true;

        "ui.systemUsesDarkTheme" = 1;

        "layout.css.prefers-color-scheme.content-override" = 0;

        "browser.display.use_system_colors" = false;

        "extensions.autoDisableScopes" = 0;
      };

      #Dark blue Miku :3
      userChrome = ''        
        :root {
          --miku-blue: #305CDE;
          --miku-cyan: #39C5BB;
          --dark-bg: #11151C;
          --text: #C8CED8;
          --purple: #560591;
        }

        #navigation-toolbox {
          background: var(--dark-bg) !important;
        }
      '';

      #need to add
      userContent = ''
         
      '';

      #need to add...
      extensions = [
      
      ];
    };
  };
}
