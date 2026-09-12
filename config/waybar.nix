{config, paks, lib, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 0;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [
          "cpu"
          "memory"
          "pulseaudio"
          "network"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
        };

        "hyprland/window" = {
          max-length = 40;
          separate-outputs = true;
        };

        "clock" = {
          format = "{:%H:%M   %d.%m.%Y}";
          tooltip-format = "{:%A, %d. %B %Y}";
          format-alt = "{:%A, %d.%m.%Y}";
        };

        "cpu" = {
          format = "🪷{usage}%";
          tooltip-format = "CPU: {usage}%";
        };

        "memory" = {
          format = "🌺{percentage}%";
          tooltip-format = "RAM: {used:0.1f} GiB / {total:0.1f} GiB";
        };

        "network" = {
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "🌸 Verbunden";
          format-disconnected = "💀 Kein Netzwerk";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "🔊{volume}%";
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
        font-family: "M PLUS Rounded 1c", "Noto Color Emoji";
        font-size: 13px;
        border: none;
        border-radius: 0;
        letter-spacing: -1px;
      }

      window#waybar {
      background: rgba(11, 16, 32, 0.92);
      color: #D9E2F2;
      border-bottom: 2px solid #305CDE;
    }

    tooltip {
      background: #0B1020;
      border: 1px solid #305CDE;
      border-radius: 8px;
      color: #D9E2F2;
    }

    #workspaces button {
      color: #305CDE;
      background: transparent;
      border-radius: 8px;
      padding: 0 6px;
      margin: 4px 1px;
    }

    #workspaces button:hover {
      background: #26304A;
      color: #90B0FF;
    }

    #workspaces button.active {
      background: #305CDE;
      color: #F4F7FF;
    }


      #clock {
        font-weight: bold;
        color: #b5a24a;
      }

      #battery.warning { color: #b5a24a; }
      #battery.critical { color: #8b3a3a; }
      #battery.charging { color: #4a5d43; }

      #clock, #battery, #network, #pulseaudio, #tray {
        padding: 0 2px;
      }
    '';
  };
}
