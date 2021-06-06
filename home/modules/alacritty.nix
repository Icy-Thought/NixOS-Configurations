{
  env = {
    "TERM" = "alacritty-direct";
  };
  
  window = {
    dynamic_title = true;
  
    dimensions = {
      lines = 29;
      columns = 118;
    };
  
    position = {
      x = 50;
      y = 50;
    };
  
    padding = {
      x = 25;
      y = 25;
    };
  
    dynamic_padding = false;
  
    decorations = "none";
  };
  
  scrolling = {
    history = 5000;
    multiplier = 3;
    faux_multiplier = 3;
  };
  
  selection = {
    semantic_escape_chars = ",│`|:\"' ()[]{}<>";
    save_to_clipboard = false;
  };
  
  shell = {
    program = "fish";
  };
  
  live_config_reload = true;
  
  font = {
    normal.family = "Iosevka Term SemiBold";
    bold.family   = "Iosevka Term SemiBold";
    italic.family = "Iosevka Term SemiBold Italic";
  
    size = 12.0;
  
    offset = {
      x = 0;
      y = 0;
    };
  
    glyph_offset = {
      x = 0;
      y = 0;
    };
  
    use_thin_strokes = true;
  };
  
  draw_bold_text_with_bright_colors = true;
  
  cursor = {
    style = "Block";
    unfocused_hollow = true;
  };
  
  background_opacity = 0.95;
  
  # One Dark Colorscheme
  colors = {
    # Default colors
    primary = {
      background = "0x1e2127";
      foreground = "0xabb2bf";
    };
  
    normal = {
      black      = "0x1e2127";
      red        = "0xe06c75";
      green      = "0x98c379";
      yellow     = "0xd19a66";
      blue       = "0x61afef";
      magenta    = "0xc678dd";
      cyan       = "0x56b6c2";
      white      = "0xabb2bf";
    };
  
    bright = {
      black      =  "0x5c6370";
      red        =  "0xe06c75";
      green      =  "0x98c379";
      yellow     =  "0xd19a66";
      blue       =  "0x61afef";
      magenta    =  "0xc678dd";
      cyan       =  "0x56b6c2";
      white      =  "0xffffff";
    };
  };
  
  key_bindings = [
    { key = "N";                mods = "Control|Shift";   action = "SpawnNewInstance"; }
    { key = "Q";                mods = "Control";         action = "Quit";             }
    { key = "V";                mods = "Control|Shift";   action = "Paste";            }
    { key = "C";                mods = "Control|Shift";   action = "Copy";             }
    { key = "NumpaddAdd";       mods = "Control";         action = "IncreaseFontSize"; }
    { key = "NumpadSubtract";   mods = "Control";         action = "DecreaseFontSize"; }
    { key = "Key0";             mods = "Control";         action = "ResetFontSize";    }
  ];
  
  mouse_bindings = [
    { mouse = "Middle";         action = "PasteSelection"; }
  ];
  
  url = {
    launcher  = "open";
    modifiers = "shift";
  };

}
