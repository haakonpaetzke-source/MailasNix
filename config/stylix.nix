{ ... }:
{
  stylix = {
    enable = true;
    image = ./wallpapers/ryo.jpeg;   # dasselbe Bild wie bei hyprpaper
    polarity = "dark";

    targets = {
      waybar.enable = false;   # AUS lassen, weil du die Waybar-Farben ja schon von Hand gebaut hast
      kitty.enable = false;    # ebenso - dein Kitty-Theme bleibt wie es ist
      gtk.enable = true;       # GTK-Apps (Thunar, etc.) übernehmen automatisch das Farbschema
      hyprlock.enable = false; # dein handgemachtes bleibt
    };
  };
}
