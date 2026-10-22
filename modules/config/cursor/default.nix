{ pkgs, inputs, ... }:
let
  miku = pkgs.callPackage ./miku-cursor-theme.nix { inherit inputs; };
in
{
  home.pointerCursor = {
    enable = true;

    name = "miku";
    package = miku;
    size = 24;
    gtk.enable = true;
    x11.enable = true;    # verlinkt nach ~/.icons/miku
  };
}
