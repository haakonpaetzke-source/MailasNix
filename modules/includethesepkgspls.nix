{ config, pkgs, lib, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    kitty
    vim
    #cool stuff
    tree
    hyfetch
    btop

    grim
    slurp

    wget
    lxqt.lxqt-policykit

    thunar
  ];
}
