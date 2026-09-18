{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    #hallo
    #hi
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;
    configType = "hyprlang";

    settings = {
      monitor = ",preferred,auto,auto";      
     
      input = {
        kb_layout = "de";
#        kb_variant =
#        kb_model =
#        kb_options =

        follow_mouse = 1;

        sensitivity = 0.5; # -1.0 - 1.0, 0 means no modification.

        touchpad.natural_scroll = false;
      };

      general = {
        gaps_in = 5;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgb(305cde) rgb(39c5bb) 45deg";
        "col.inactive_border" = "rgb(26304a)";
      };
    
      decoration = {
        rounding = 12;
        blur.enabled = true;
        blur.size = 4;
        blur.passes = 2;
        shadow.enabled = true;
      };
      
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      
      # Bitty mach mal die Programme an :3
      exec-once = [
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "waybar"
        "hyprpaper"
      ];

      # Keybindings
      "$mod" = "SUPER";      
      bind = [
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, E, exec, kitty -- yazi"
        "$mod, Z, exec, zen-beta"
        "$mod, V, togglefloating"
        "$mod, R, exec, wofi --show drun"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod SHIFT, left, swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up, swapwindow, u"
        "$mod SHIFT, down, swapwindow, d"
        
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];
      
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      binde = [
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];
    };
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

  #Zu lautes Miaun :3
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
  };
}
