{ config, pkgs, lib, inputs, osage-grub-theme, ... }: {
   # Grub einstellen
   boot.loader = {
     grub = {
        enable = true;
        efiSupport = false;
        device = "/dev/sda";
        useOSProber = true;
        #theme = osage-grub-theme;
        gfxmodeEfi = "auto"; # set your resolution
        gfxpayloadEfi = "keep";
        milk-theme.enable = true;
     };
     efi.canTouchEfiVariables = true;
   };
}
