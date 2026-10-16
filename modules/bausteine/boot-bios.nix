{ config, pkgs, lib, inputs, osage-grub-theme, ... } : {
  boot.loader = {
    grub = {
      enable = true;

      efiSupport = flase;
      device = "/dev/sda";

      useOSProber = true;

      # theme = osage-grub-theme;
      milk-theme.enable = true;

      gfxmodeEfi = "auto";
      gfxpayloadEfi = "keep";
    };

    efi = {
      canTouchEfiVariables = true;
    };
  };
}
