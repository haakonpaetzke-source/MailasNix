{ config, pkgs, lib, inputs, ... }: {
   home-manager = {
     useGlobalPkgs = true;
     useUserPackages = true;

     users = {
       "mai" = import ../config/default.nix;
     };
  };
}
