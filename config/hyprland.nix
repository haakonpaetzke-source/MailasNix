{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    #hallo
    #hi
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;
    configType = "lua";
    settings = {};

    extraConfig = builtins.readFile ./hyprland.lua;    
  };

  #Hyprpaper für Hintergund
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = true;
      splash = false;

      wallpaper = {
        monitor = "";
        path = "/etc/nixos/config/Pictures/ryo.jpeg";
        fit_mode = "cover";
      };
    };
  };

  #Miaun :3
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
  };
}
