{ config, pkgs, lib, inputs, ... }: {
   home-manager = {
     useGlobalPkgs = true;
     useUserPackages = true;

     backupCommand = "cp --remove-destination";

     users = {
       "mai" = import ../config/default.nix;
     };
  };
}
