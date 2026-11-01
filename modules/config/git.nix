{config, pkgs, lib, ...}: {
  programs.git = {
    enable = true;
    
    settings = {
      user = {
	name = "Maila";
	email = "maila@gmail.com";
      };

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
