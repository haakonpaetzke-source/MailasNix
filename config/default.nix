{ config, pkgs, lib, ... }: 
{
  imports = [
    ./hyprland.nix
    ./git.nix
  ];

  home = {
    username = "mai";
    homeDirectory = "/home/mai";
    stateVersion = "26.05";
  };
  
  programs.home-manager.enable = true;
}
