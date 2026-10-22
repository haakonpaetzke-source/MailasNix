{ config, pkgs, lib, inputs, osage-grub-theme, ... } : {
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = false;
      device = "/dev/sda";
      useOSProber = true;

      # theme = osage-grub-theme;
      milk-theme.enable = true;
    };

    efi.canTouchEfiVariables = true;
  };
}
