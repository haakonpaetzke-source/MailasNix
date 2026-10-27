{ config, pkgs, lib, inputs, ... }: {
  programs.java.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      stdenv.cc.cc
      libglvnd
      vulkan-loader
      wayland
      libxkbcommon 
    ];
  };

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

    modrinth-app
  ];
}
