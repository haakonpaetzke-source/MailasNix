fonts = {
  packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fontconfig = {
    defaultFonts = {
      sansSerif = [
        "Noto Sans"
        "Noto Sans CJK JP"
      ];

      serif = [
        "Noto Serif"
        "Noto Serif CJK JP"
      ];

      monospace = [
        "Noto Sans Mono CJK JP"
      ];

      emoji = [
        "Noto Color Emoji"
      ];
    };
  };
};
