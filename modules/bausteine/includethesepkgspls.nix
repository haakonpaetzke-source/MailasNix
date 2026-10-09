{ config, pkgs, lib, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    kitty
    vim
    #cool stuff
    tree
    hyfetch
    fastfetch
    btop

    grim
    slurp

    wget
    lxqt.lxqt-policykit

    thunar
  ];
}
