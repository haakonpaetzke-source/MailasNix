{ config, pkgs, lib, ... }: { 
   home.packages = [ 
    (pkgs.writeShellScriptBin "fullupdate" 
     '' 
       set -e echo "-> Updating flake..." 
       nix flake update --flake /etc/nixos 
       echo "-> Rebuilding NixOS..." 
       sudo nixos-rebuild switch --flake /etc/nixos#nixos 
       echo "✓ NixOS is up to date :3" 
     '')
 
     (pkgs.writeShellScriptBin "Update" 
     '' 
       sudo nixos-rebuild switch --flake /etc/nixos#nixos 
     '') 
     
     (pkgs.writeShellScriptBin "nixtest" 
     '' 
       sudo nixos-rebuild test --flake /etc/nixos#nixos 
     '') 

     (pkgs.writeShellScriptBin "writeboot" 
     '' 
       sudo nixos-rebuild boot --flake /etc/nixos#nixos 
     '') 
    
     (pkgs.writeShellScriptBin "cleanUP" 
     ''
       echo "-> Cleaning old generations..." 
       sudo nix-collect-garbage -d 
       echo "→ Optimising Nix store..." 
       sudo nix-store --optimise 
       echo "✓ Nix store cleaned :3" 
     '') 

     (pkgs.writeShellScriptBin "gaco" 
     '' 
       sudo nix-collect-garbage -d 
     '') 
    
     (pkgs.writeShellScriptBin "flcheck" 
     '' 
       nix flake check /etc/nixos 
     '') 

     (pkgs.writeShellScriptBin "flshow" 
     '' 
       nix flake show /etc/nixos 
     '') 

     (pkgs.writeShellScriptBin "flmeta" 
     '' 
       nix flake metadata /etc/nixos 
     '') 
 
     (pkgs.writeShellScriptBin "search" 
     '' 
       if [ -z "$1" ]; then 
         echo "Usage: nixsearch <package>" 
         exit 1 
       fi 
         nix search nixpkgs "$1" 
     '') 
    
     (pkgs.writeShellScriptBin "nixcfg" 
     '' 
       cd /etc/nixos/ 
     '')

     (pkgs.writeShellScriptBin "gitfill" 
     '' 
       echo "Adding everything";
       sudo git add -A;
       echo "Commiting everything";
       sudo git commit -m "$1";
       echo "Pushing everything :3";
       sudo git push orgin main;
     '') 
   ]; 

   programs.bash.shellAliases = { 
    # Navigation 
    ".." = "cd .."; 
    "..." = "cd ../.."; 
    "...." = "cd ../../.."; 
    
    # Git shit 
    gs = "git status"; 
    ga = "sudo git add"; 
    gp = "git push origin main"; 
    gl = "git log --oneline --graph --decorate"; 

    # Misc 
    c = "clear"; 
    sn = "sudo nano";
  }; 
}
