{
  description = "Mailas Flocke :3";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    chaotic.url = "github:chaotic-cx/nyx";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {
      url = "github:hyprwm/Hyprland/v0.52.2?submodules=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock/v0.9.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    osage-grub-theme = {
      url = "github:Hitori-Laura/myGrubThemes";
      flake = false;
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emaxs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay.url = "github:oxalica/rust-overlay";

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
  };

  outputs = 
    inputs@{ self, nixpkgs, osage-grub-theme, ... }:
    let
       system = "x86_64-linux";

       #erstelle gepatchede nixpkgs
       nixpkgs-patched = (import inputs.nixpkgs { inherit system; }).applyPatches {
         name = "nixpkgs-patched";
         src = inputs.nixpkgs;
         patches = [ ];
       };

       #erstelle Hauptpaketblock
       pkgs = import nixpkgs-patched {
          inherit system;
          config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
          };
          overlays = [
             inputs.rust-overlay.overlays.default
             inputs.emaxs-overlay.overlays.default
             inputs.chaotic.overlays.default
          ];
       }; 

       pkgs-stable = import inputs.nixpkgs-stable {
          inherit system;
          config = {
             allowUnfree = true;
             allowUnfreePredicate = (_: true);
          };
       };
      
       lib = inputs.nixpkgs.lib;
    in  
    {
      nixosConfigurations.nixos = lib.nixosSystem {
        specialArgs = { 
           inherit pkgs-stable inputs;
           inherit osage-grub-theme;
        };
        
        modules = [
          ./configuration.nix

          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix

          {
             home-manager.extraSpecialArgs = {
               inherit pkgs pkgs-stable inputs;
             };
          }

          inputs.chaotic.nixosModules.default
        ];
      };
    };
}
