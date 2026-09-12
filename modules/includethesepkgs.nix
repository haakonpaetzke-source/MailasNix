{ config, pkgs, lib, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    vim

    tree
 
    wget
    hyprpaper
    kitty
    waybar
    wofi
    mako
    libnotify
    wl-clipboard
    cliphist
    nwg-look

    grim
    slurp

    lxqt.lxqt-policykit

    hyfetch
    btop
    thunar

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
