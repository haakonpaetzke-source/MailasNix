{ config, pkgs, lib, ... }:
let
  # Reine Daten, unabhängig vom Hyprland-Modul — bricht nicht mehr,
  # wenn sich am Lua-Generator was ändert
  keybinds = [
    "$mod, Return, exec, kitty"
    "$mod, Q, killactive"
    "$mod, M, exit"
    "$mod, E, exec, thunar"
    "$mod, V, togglefloating"
    "$mod, R, exec, wofi --show drun"
    "$mod, P, pseudo"
    "$mod, J, togglesplit"
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"
    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
    "$mod SHIFT, 3, movetoworkspace, 3"
  ];

  format-keybind = bind:
    let
      parts = lib.splitString "," bind;
      keys = lib.concatStringsSep "," (lib.take 2 parts);
      action = lib.concatStringsSep "," (lib.drop 2 parts);
    in
    "<b>${lib.replaceStrings [ "$mod" ] [ "SUPER" ] keys}</b>: ${action}";

  formatted-keybinds = map format-keybind keybinds;

  keybinds-script = pkgs.writeShellScriptBin "hypr-keybinds" ''
    echo -e "${lib.concatStringsSep "\\n" formatted-keybinds}" | wofi --show dmenu --allow-markup -p "Hyprland Keybindings"
  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "lua";   # <-- jetzt korrekt AUSSERHALB von settings
    settings = {};        # <-- leer! wir umgehen den kaputten Generator komplett

    # Deine ECHTE Config kommt hier rein — als fertig konvertiertes,
    # garantiert valides Lua (siehe Konvertierungs-Plan von eben)
    extraConfig = builtins.readFile ./hyprland.lua;
  };

  home.packages = [ keybinds-script ];

  programs.waybar = {
    enable = true;
    systemd.enable = false;
  };

  programs.wofi.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      font_size = 11;
      background_opacity = "0.95";
    };
  };

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
    };
  };
}
