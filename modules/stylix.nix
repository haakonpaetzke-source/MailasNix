{ config, pkgs, lib, inputs, ... }: {
  stylix = {
    enable = true;
    image = ../config/wallpapers/ryo.jpeg;   # dasselbe Bild wie bei hyprpaper
    polarity = "dark";
  };
}
