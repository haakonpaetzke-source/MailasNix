{ config, pkgs, lib, inputs, ... }: 
let
  pre = ../../modules/config;
in
{
   home-manager = {
     useGlobalPkgs = true;
     useUserPackages = true;

     backupCommand = "cp --remove-destination";

     users = {
       "mai" = { config, pkgs, lib, inputs, ... }:{
	  imports = [
	    (pre + "/hyprland")
	    (pre + "/git.nix")
	    (pre + "/kitty-wofi.nix")
	    (pre + "/waybar.nix")
	    (pre + "/darkmode.nix")
	    (pre + "/zen.nix")
	    (pre + "/mime.nix")
	    (pre + "/vesktop.nix")
	    (pre + "/donnervogel.nix")
	    (pre + "/commands.nix")
    
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
	};
     };
  };
}
