{ config, pkgs, lib, ... }: {
programs.kitty = {
  enable = true;
  
  font = {
     name = "M PLUS Rounded 1c";
     size = 11;
  };

  settings = {
    background_opacity = "0.60";
    
    background = "#11151C";
    foreground = "#C8CED8";
    cursor = "#6F89A8";
    selection_background = "#293849";
  };

  extraConfig = ''
    # Normal
    color0  #0B1020
    color1  #ff00ff
    color2  #305cde
    color3  #90d5ff
    color4  #305cde
    color5  #560591
    color6  #39C5BB
    color7  #D9E2F2

    # Bright
    color8  #26304A
    color9  #ff00ff
    color10 #305cde
    color11 #90d5ff
    color12 #305cde
    color13 #560591
    color14 #66E0D5
    color15 #F4F7FF
  '';
};

programs.wofi = {
  enable = true;
  style = ''
    * {
      font-family: "M PLUS Rounded 1c", "Noto Color Emoji";
    }
    window {
      background-color: #11151C;
      border: 2px solid #305CDE;
      border-radius: 8px;
    }
    #input {
      background-color: #202630;
      color: #C8CED8;
      margin: 6px;
      padding: 6px;
    }
    #entry {
      color: #C8CED8;
    }
    #entry:selected {
      background-color: #305CDE;
      color: #D7DCE3;
      border-radius: 6px;
    }
  '';
};
}
