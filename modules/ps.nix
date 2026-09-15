{ config, pkgs, lib, inputs, ... }: {
  # Enable CUPS to print documents.
  services.printing.enable = true;
}
