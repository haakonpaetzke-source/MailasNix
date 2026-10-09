{ config, pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      mplus-outline-fonts.githubRelease
      noto-fonts-color-emoji
    ];

    fontconfig.defaultFonts = {
      sansSerif = [
        "M PLUS Rounded 1c"
      ];

      serif = [
        "M PLUS Rounded 1c"
      ];

      monospace = [
        "M PLUS Rounded 1c"
      ];

      emoji = [
        "Noto Color Emoji"
      ];
  
    };
  };
}
