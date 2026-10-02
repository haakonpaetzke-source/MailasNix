{ config, pkgs, ... }: {
  imports = [
    ./sddm-hyprland.nix
    ./boot.nix    
    ./ortundzeit.nix
    ./user.nix
    ./network.nix
    ./audio.nix
    ./includethesepkgspls.nix
    ./ps.nix
    ./home.nix
    ./badapple.nix
  ];
}
