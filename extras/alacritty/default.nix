{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {

      env = {
        "TERM" = "alacritty-direct";
      };

      window = {
        dimensions = {
          lines = 29;
          columns = 118;
        };

        padding = {
          x = 5;
          y = 5;
        };
      };

      font = {
        size = 12.0;
        use_thin_strokes = true;

        normal.family = "Iosevka SemiBold";
        bold.family   = "Iosevka SemiBold";
        italic.family = "Iosevka SemiBold";
      };

      cursor.style = "Beam";

      shell = {
        program = "fish";
      };

      keybindings = [
        { key = "N";      mods = "Control|Shift";   actions = "SpawnNewInstance"; }
        { key = "V";      mods = "Control|Shift";   actions = "Paste";            }
        { key = "C";      mods = "Control|Shift";   actions = "Copy";             }
        { key = "Add";    mods = "Control";         actions = "IncreaseFontSize"; }
        { key = "Minus";  mods = "Control";         actions = "DecreaseFontSize"; }
        { key = "Key0";   mods = "Control";         actions = "ResetFontSize";    }
      ];

      # Challenge Deep
      colors = {
        # Default colors
        primary = {
          background = "0x1b182c";
          foreground = "0xcbe3e7";
        };

        # Normal colors
        normal = {
          black =   "0x100e23";
          red =     "0xff8080";
          green =   "0x95ffa4";
          yellow =  "0xffe9aa";
          blue =    "0x91ddff";
          magenta = "0xc991e1";
          cyan =    "0xaaffe4";
          white =   "0xcbe3e7";
        };

        # Bright colors
        bright = {
          black =   "0x565575";
          red =     "0xff5458";
          green =   "0x62d196";
          yellow =  "0xffb378";
          blue =    "0x65b2ff";
          magenta = "0x906cff";
          cyan =    "0x63f2f1";
          white =   "0xa6b3cc";
        };
      };
    };
  };

}
