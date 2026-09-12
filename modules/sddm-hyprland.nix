{ config, pkgs, lib, inputs, ... }:

let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";  # or any other theme
  };
in {
  programs.hyprland = {
     enable = true;
     #hallo
     #hi
     package = inputs.hyprland.packages.${pkgs.system}.hyprland;
     portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  services.displayManager = {
    sddm = {
       enable = true;
       wayland.enable = false;
       package = pkgs.kdePackages.sddm;
       extraPackages = with pkgs; [
         kdePackages.qtmultimedia
       ];
       theme = "sddm-astronaut-theme";
    };
 
    defaultSession = "hyprland";
  };

  environment.systemPackages = [ sddm-astronaut ];
  
  services.xserver.enable = true;

  security.polkit.enable = true;
}
