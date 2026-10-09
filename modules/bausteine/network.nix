{
  #Netzwerk
  networking = {
    networkmanager.enable = true;
    enableIPv6 = true;

    hostName = "Sheoldred";
  };

  #Blau Zahn :3
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;

    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
