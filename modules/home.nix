{ config, pkgs, lib, inputs, ... }: {
   home-manager = {
     useGlobalPkgs = true;
     useUserPackages = true;

     backupFileExtension = "backup";

     users = {
       "mai" = import ../config/default.nix;
     };
  };
}
