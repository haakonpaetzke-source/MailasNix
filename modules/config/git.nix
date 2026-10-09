{config, pkgs, lib, ...}: {
  programs.git = {
    enable = true;
    userName = "Maila"; # Replace with your actual name
    userEmail = "maila@gmail.com"; # Replace with your actual email
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  # Lazygit configuration (optional)
  programs.lazygit = {
    enable = true;
    # settings = { ... }; # Add custom lazygit settings if needed
  };
}
