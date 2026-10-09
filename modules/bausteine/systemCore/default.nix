{ config, ... }:{
  imports = [
    ./audio.nix
    ./boot.nix
    ./network.nix
    ./ordundzeit.nix
    ./user.nix
    ./ps.nix
  ];
}
