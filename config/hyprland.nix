{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    thunar
  ];

  # Hyprland als Window Manager in Home Manager
  wayland.windowManager.hyprland = {
    enable = true;
    # Deine Hyprland-Konfiguration
    settings = {
      # Monitor
      monitor = ",preferred,auto,auto";
      
      # Eingabe
      input = {
        kb_layout = "de";
#        kb_variant =
#        kb_model =
#        kb_options =

        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = false;
        };
      };
      # Allgemein
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };
      
      # Dekoration
      decoration = {
        rounding = 12;
        blur.enabled = true;
        shadow.enabled = true;
      };
      
      # Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      
      # Autostart
      exec-once = [
        "waybar"
        "mako"  # Benachrichtigungen
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
      
      # Keybindings
      "$mod" = "SUPER";
      
      bind = [
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, E, exec, thunar"
        "$mod, V, togglefloating"
        "$mod, R, exec, wofi --show drun"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        
        # Fenster fokussieren
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        
        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        
        # Fenster zu Workspace verschieben
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
      ];
      
      # Maus-Keybindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  # Waybar (Status-Leiste)
  programs.waybar = {
    enable = true;
    systemd.enable = false;  # Wir starten es über exec-once
  };

  # Wofi (App-Launcher)
  programs.wofi = {
    enable = true;
  };

  # Terminal
  programs.kitty = {
    enable = true;
    settings = {
      font_size = 11;
      background_opacity = "0.95";
    };
  };

  # Benachrichtigungen
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
  };
}
