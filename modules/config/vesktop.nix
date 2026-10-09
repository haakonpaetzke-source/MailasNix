{config, pkgs, inputs, ... }: {
  programs.nixcord = {
    enable = true;

    vesktop.enable = true;

    config = {

      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;

      useQuickCss = true;

      plugins = {
        betterFolders = {
          enable = true;
        };

        betterUploadButton = {
          enable = true;
        };

        viewIcons = {
          enable = true;
        };

        volumeBooster = {
          enable = true;
        };

        shikiCodeblocks = {
          enable = true;
        };

        silentTyping = {
          enable = true;
        };

        fixYoutubeEmbeds = {
          enable = true;
        };

        imageZoom = {
          enable = true;
        };

        gifPaste = {
          enable = true;
        };

        messageLatency = {
          enable = true;
        };

        readAllNotificationsButton = {
          enable = true;
        };
      };
    };

    # ══════════════════════════════════════════════
    # MIKU!!! :D
    # ══════════════════════════════════════════════
quickCss = ''
  /* ═══════════════════════════════════════════════
     🌊 MIKU / ROYAL BLUE THEME 🌊
     ═══════════════════════════════════════════════ */

  :root {
    --miku-blue: #305CDE;
    --miku-cyan: #39C5BB;
    --miku-light-blue: #90D5FF;
    --miku-pink: #FF00FF;
    --miku-purple: #560591;

    --miku-bg: #0B1020;
    --miku-surface: #11151C;
    --miku-surface-2: #151B2B;
    --miku-hover: #1B2850;
  }

  /* ───────────────────────────────────────────────
     Haupt-Hintergrund
     ─────────────────────────────────────────────── */

  .appMount__51fd7,
  .bg__960e4,
  .layer__960e4,
  .container__133bf,
  .content__5e434 {
    background: var(--miku-bg) !important;
  }

  /* ───────────────────────────────────────────────
     Server-/Channel-Bereich
     ─────────────────────────────────────────────── */

  .guilds__5e434 {
    background: #080D19 !important;
  }

  .sidebar__5e434 {
    background: var(--miku-surface) !important;
  }

  .panels__5e434 {
    background: #0D1322 !important;
  }

  /* ───────────────────────────────────────────────
     Channel-Liste
     ─────────────────────────────────────────────── */

  .container__2637a {
    background: var(--miku-surface) !important;
  }

  .wrapper__2ea32:hover,
  .link__2ea32:hover {
    background: var(--miku-hover) !important;
  }

  /* ───────────────────────────────────────────────
     Chat
     ─────────────────────────────────────────────── */

  .chatContent_f75fb0 {
    background: var(--miku-bg) !important;
  }

  .messagesWrapper__36d07 {
    background: var(--miku-bg) !important;
  }

  .message__5126c:hover {
    background: rgba(48, 92, 222, 0.08) !important;
  }

  /* ───────────────────────────────────────────────
     Links
     ─────────────────────────────────────────────── */

  a {
    color: var(--miku-light-blue) !important;
  }

  a:hover {
    color: var(--miku-cyan) !important;
  }

  /* ───────────────────────────────────────────────
     Mentions
     ─────────────────────────────────────────────── */

  .mention {
    color: var(--miku-cyan) !important;
    background: rgba(57, 197, 187, 0.14) !important;
    border-radius: 5px;
  }

  /* ───────────────────────────────────────────────
     Buttons
     ─────────────────────────────────────────────── */

  .button__201d5 {
    background: var(--miku-blue) !important;
  }

  .button__201d5:hover {
    background: var(--miku-cyan) !important;
  }

  /* ───────────────────────────────────────────────
     Search
     ─────────────────────────────────────────────── */

  .searchBar__97492 {
    background: var(--miku-surface-2) !important;
    border-radius: 10px;
  }

  /* ───────────────────────────────────────────────
     Textfelder
     ─────────────────────────────────────────────── */

  .scrollableContainer__74017 {
    background: var(--miku-surface) !important;
    border: 1px solid rgba(48, 92, 222, 0.35);
  }

  /* ───────────────────────────────────────────────
     Code
     ─────────────────────────────────────────────── */

  code {
    background: #080D19 !important;
    border-radius: 8px;
  }

  /* ───────────────────────────────────────────────
     Scrollbar
     ─────────────────────────────────────────────── */

  ::-webkit-scrollbar {
    width: 8px;
  }

  ::-webkit-scrollbar-thumb {
    background: var(--miku-blue) !important;
    border-radius: 10px;
  }

  ::-webkit-scrollbar-thumb:hover {
    background: var(--miku-cyan) !important;
  }

  ::-webkit-scrollbar-track {
    background: #080D19 !important;
  }

  /* ───────────────────────────────────────────────
     Auswahl
     ─────────────────────────────────────────────── */

  ::selection {
    background: var(--miku-blue);
    color: white;
  }
'';
  };

  
    home.activation.makeVesktopConfigWritable =
      config.lib.dag.entryAfter [ "writeBoundary" ] ''
        for file in \
          "$HOME/.config/vesktop/settings/settings.json" \
          "$HOME/.config/vesktop/settings/quickCss.css" \
          "$HOME/.config/Vencord/settings/quickCss.css"
        do
          if [ -L "$file" ]; then
            target="$(readlink -f "$file")"
            rm -f "$file"
            install -Dm644 "$target" "$file"
          fi
        done
      '';
}
