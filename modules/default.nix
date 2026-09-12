{ config, pkgs, ... }: {
  imports = [
    ./sddm-hyprland.nix
    ./boot.nix    
    ./ortundzeit.nix
    ./user.nix
    ./network.nix
    ./audio.nix
    ./includethesepkgs.nix
    ./ps.nix
    ./home.nix
#    ./stylix.nix
  ];
}
