{ config, pkgs, lib, ... }: 
{
  imports = [
    ./hyprland.nix
    ./git.nix
    ./kitty-wofi.nix
    ./waybar.nix
    ./stylix.nix
  ];

  home = {
    username = "mai";
    homeDirectory = "/home/mai";
    stateVersion = "26.05";
  };

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    thunar
    waybar
    hyprpaper
    kitty
  ];
  
  programs.home-manager.enable = true;
}
