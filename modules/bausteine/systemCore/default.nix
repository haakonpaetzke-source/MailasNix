{ config, ... }:{
  imports = [
    ./audio.nix
    ./network.nix
    ./ortundzeit.nix
    ./user.nix
    ./ps.nix
  ];
}
