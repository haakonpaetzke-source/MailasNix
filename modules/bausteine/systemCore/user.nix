{ config, pkgs, lib, inputs, ... }: { 
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mai = {
    isNormalUser = true;
    home = "/home/mai";
    description = "Maila";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "input"];
  };
}
