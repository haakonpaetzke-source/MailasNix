{ config, pkgs, lib, inputs, ... }: 
{
  imports = [
    ./hyprland.nix
    ./git.nix
    ./kitty-wofi.nix
    ./waybar.nix
    ./darkmode.nix
    ./zen.nix
    ./mime.nix
    ./vesktop.nix
    ./donnervogel.nix
    
    inputs.nixcord.homeModules.nixcord
  ];

  home = {
    username = "mai";
    homeDirectory = "/home/mai";
    stateVersion = "26.05";
  };

  home.packages = with pkgs; [
    #hyprland Stuff
    wl-clipboard
    cliphist
    thunar
    waybar
    wofi
    mako
    hyprpaper

    kitty

    yazi

    signal-desktop
    zapzap
  ];
  
  programs.home-manager.enable = true;
}
