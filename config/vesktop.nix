{ pkgs, ... }:

{
  programs.vesktop = {
    enable = true;

    # ─────────────────────────────────────────────
    # Vesktop selbst
    # ─────────────────────────────────────────────

    settings = {
      # Discord Stable verwenden
      discordBranch = "stable";

      # Hardwarebeschleunigung
      hardwareAcceleration = true;

      # Discord/Vesktop nicht automatisch aktualisieren
      # Nix soll die Version verwalten.
      checkUpdates = false;

      # Vesktop soll nicht unnötig im Tray bleiben
      minimizeToTray = false;
      tray = false;

      # Eigene Titelleiste von Discord/Vesktop
      customTitleBar = false;

      # Statischer Fenstertitel
      staticTitle = true;

      # Splash Screen
      splashTheming = true;
      splashBackground = "#11151C";
      splashColor = "#39C5BB";
    };

    # ─────────────────────────────────────────────
    # Vencord
    # ─────────────────────────────────────────────

    vencord = {

      # Vencord aus Nixpkgs verwenden
      useSystem = true;

      settings = {
        # Vencord selbst nicht automatisch verändern
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;

        # QuickCSS aktivieren
        useQuickCss = true;

        # ─────────────────────────────────────────
        # Plugins
        # ─────────────────────────────────────────

        plugins = {

          # Serverordner verbessern
          BetterFolders = {
            enabled = true;
          };

          # Bessere Upload-Funktionen
          BetterUploadButton = {
            enabled = true;
          };

          # Profilbilder größer anschauen
          ViewIcons = {
            enabled = true;
          };

          # Lautstärke über Discords normales Maximum
          VolumeBooster = {
            enabled = true;
          };

          # Schöne Syntax-Hervorhebung für Codeblöcke
          ShikiCodeblocks = {
            enabled = true;
          };

          SilentTyping = {
            enabled = true;
          };

          FixYoutubeEmbeds = {
            enabled = true;
          };

          ImageZoom = {
            enabled = true;
          };

          GifPaste = {
            enabled = true;
          };

          MessageLatency = {
            enabled = true;
          };

          ReadAllNotificationsButton = {
            enabled = true;
          };
        };
      };

     #Theme Miku :3
      extraQuickCss = ''
        :root {
          --miku-blue: #305CDE;
          --miku-cyan: #39C5BB;
          --miku-pink: #FF00FF;
          --miku-bg: #11151C;
          --miku-bg-dark: #0B1020;
        }

        .guilds_c48ade .scroller_fea3ef {
          border-radius: 14px;
        }

        .wrapper__8436d {
          transition:
            transform 0.15s ease,
            filter 0.15s ease;
        }

        .wrapper__8436d:hover {
          transform: translateY(-2px);
          filter: brightness(1.15);
        }

        .link__2e8e1.selected__2ea32 {
          border-radius: 8px;
        }

        .mention {
          color: #39C5BB !important;
          background: rgba(57, 197, 187, 0.12) !important;
          border-radius: 5px;
        }

        a {
          color: #90D5FF;
        }

        code {
          border-radius: 8px;
        }

        .messageListItem_d5deea {
          border-radius: 6px;
        }

        ::-webkit-scrollbar {
          width: 8px;
        }

        ::-webkit-scrollbar-thumb {
          background: #305CDE;
          border-radius: 10px;
        }

        ::-webkit-scrollbar-track {
          background: #0B1020;
        }

        .searchBar__97492 {
          border-radius: 10px;
        }

        button {
          transition:
            background-color 0.15s ease,
            transform 0.1s ease;
        }

        button:hover {
          transform: translateY(-1px);
        }
      '';
    };
  };
}
