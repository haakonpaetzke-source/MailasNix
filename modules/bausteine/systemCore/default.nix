{ config, ... }:{
  imports = [
    ./audio.nix
    ./boot.nix
    ./network.nix
    ./ortundzeit.nix
    ./user.nix
    ./ps.nix
  ];
}
