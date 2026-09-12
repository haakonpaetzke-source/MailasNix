{config, paks, lib, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
        };

        "hyprland/window" = {
          max-length = 40;
          separate-outputs = true;
        };

        "clock" = {
          format = "{:%H:%M}   {:%d.%m.%Y}";
          tooltip-format = "{:%A, %d. %B %Y}";
          format-alt = "{:%A, %d.%m.%Y}";
        };

        "network" = {
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "󰈀 Verbunden";
          format-disconnected = "󰤭 Kein Netzwerk";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-muted = "󰝟 Stumm";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          format = "{icon}  {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          format-charging = "  {capacity}%";
          states = {
            warning = 25;
            critical = 10;
          };
        };

        "tray" = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        font-family: "Noto Sans", "Noto Sans CJK JP", "Noto Color Emoji";
        font-size: 13px;
        border: none;
        border-radius: 0;
      }

      window#waybar {
        background-color: #1a1a1d;
        color: #d4d0c8;
        border-bottom: 2px solid #b5a24a;
      }

      #workspaces button {
        padding: 0 8px;
        color: #d4d0c8;
        background: transparent;
      }

      #workspaces button.active {
        color: #1a1a1d;
        background-color: #b5a24a;
        border-radius: 6px;
      }

      #workspaces button.urgent {
        background-color: #8b3a3a;
      }

      #clock {
        font-weight: bold;
        color: #b5a24a;
      }

      #battery.warning { color: #b5a24a; }
      #battery.critical { color: #8b3a3a; }
      #battery.charging { color: #4a5d43; }

      #clock, #battery, #network, #pulseaudio, #tray {
        padding: 0 10px;
      }
    '';
  };
}
