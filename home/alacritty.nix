{ lib, pkgs, ... }:
{
  enable = true;
  settings = {
    general = {
      working_directory = "None";
      live_config_reload = true;
      ipc_socket = true;
    };
    window = {
      dimensions = {
        columns = 0;
        lines = 0;
      };
      position = "None";
      padding = {
        x = 10;
        y = 10;
      };
      dynamic_padding = false;
      decorations = "Buttonless";
      opacity = 0.8;
      blur = true;
      startup_mode = "Windowed";
      title = "Alacritty";
      dynamic_title = true;
      class = {
        instance = "Alacritty";
        general = "Alacritty";
      };
      decorations_theme_variant = "None";
      resize_increments = false;
      option_as_alt = "Both";
    };
    scrolling = {
      history = 10000;
      multiplier = 3;
    };
    font = {
      normal = { family = "MD IO Trial"; style = "Regular"; };
      bold = { family = "MD IO Trial"; style = "Bold"; };
      italic = { family = "MD IO Trial"; style = "Italic"; };
      bold_italic = { family = "MD IO Trial"; style = "Bold Italic"; };
      size = 12.0;
      offset = { x = 0; y = 0; };
      glyph_offset = { x = 0; y = 0; };
      builtin_box_drawing = true;
    };
    bell = {
      animation = "Linear";
      duration = 0;
      color = "#ffffff";
      command = "None";
    };
    selection = {
      semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
      save_to_clipboard = false;
    };
    cursor = {
      style = {
        shape = "Block";
        blinking = "On";
      };
      vi_mode_style = "None";
      blink_interval = 750;
      blink_timeout = 5;
      unfocused_hollow = true;
      thickness = 0.15;
    };
    terminal = {
      shell = {
        program = "${lib.getExe pkgs.fish}";
        args = [ "-l" ];
      };
      osc52 = "OnlyCopy";
    };
    mouse = {
      hide_when_typing = false;
      bindings = [
        {
          mouse = "Right";
          mods = "Control";
          action = "Paste";
        }
      ];
    };
    hints = {
      alphabet = "jfkdls;ahgurieowpq";
      enabled = [
        {
          command = "open";
          hyperlinks = true;
          persist = false;
          mouse = {
            enabled = true;
          };
          binding = {
            key = "O";
            mods = "Control|Shift";
          };
        }
      ];
    };
    keyboard = {
      bindings = [ ];
    };
    debug = {
      render_timer = false;
      persistent_logging = false;
      log_level = "Warn";
      renderer = "None";
      print_events = false;
      highlight_damage = false;
      prefer_egl = false;
    };
  };
}
