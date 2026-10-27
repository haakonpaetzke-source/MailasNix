{ config, pkgs, inputs, ... }: {
  imports = [
    ../cursor
  ];

  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    #hallo
    #hi
    package = null;
    portalPackage = null;

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
        path = "/home/mai/customization/Wallpaper/ryo.jpg";
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
