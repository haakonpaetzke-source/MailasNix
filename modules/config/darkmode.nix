{ config, pkgs, lib, ... }: {
  # ============================================================
  # DARK MODE
  # ============================================================

  # GTK-Anwendungen
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
    };
    colorScheme = "dark";
  };

  # Qt-Anwendungen
  qt = {
    enable = true;

    platformTheme.name = "gtk3";
    style.name = "adwaita-dark";
  };

  # DCONF
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # XDG / GTK UMGEBUNG

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
  };
}
