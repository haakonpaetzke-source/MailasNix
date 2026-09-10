{ config, pkgs, lib, inputs, osage-grub-theme, ... }: {
   # Grub einstellen
   boot.loader = {
     grub = {
        enable = true;
        efiSupport = false;
        device = "/dev/sda";
        useOSProber = true;
        theme = osage-grub-theme;
     };
     efi.canTouchEfiVariables = true;
   };
}
