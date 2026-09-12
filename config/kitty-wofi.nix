programs.kitty = {
  enable = true;
  
  font = {
     name = "Noto Sans Mono CJK JP";
     size = 11;
  };

  settings = {
    font_family = "Noto Sans Mono CJK JP";
    symbol_map = "U+E000-U+F8FF Symbols Nerd Font";
    background_opacity = "0.92";
    background = "#1a1a1d";
    foreground = "#d4d0c8";
    cursor = "#b5a24a";
    selection_background = "#4a5d43";
  };
  extraConfig = ''
    color0  #1a1a1d
    color8  #3a3a3d
    color1  #8b3a3a
    color9  #a84a4a
    color2  #4a5d43
    color10 #5f7856
    color3  #b5a24a
    color11 #cbb85e
    color4  #5a6b7a
    color12 #7a8fa3
    color5  #7a5d6b
    color13 #9a7a8b
    color6  #4a7a7a
    color14 #5f9a9a
    color7  #d4d0c8
    color15 #f0ede6
  '';
};

programs.wofi = {
  enable = true;
  style = ''
    * {
      font-family: "Noto Sans", "Noto Sans CJK JP", "Noto Color Emoji";
    }
    window {
      background-color: #1a1a1d;
      border: 2px solid #b5a24a;
      border-radius: 8px;
    }
    #input {
      background-color: #262629;
      color: #d4d0c8;
      margin: 6px;
      padding: 6px;
    }
    #entry:selected {
      background-color: #b5a24a;
      color: #1a1a1d;
      border-radius: 6px;
    }
  '';
};
