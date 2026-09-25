{ config, pkgs, lib, inputs, ... }: {
  services.printing.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };


  programs.steam = {
    enable = true;
    
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    gamescope
  ];
}

