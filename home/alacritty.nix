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
    # colors =
      # let
      #   catppuccin = {
      #     frappe = {
      #       primary = { background = "#303446"; foreground = "#c6d0f5"; dim_foreground = "#838ba7"; bright_foreground = "#c6d0f5"; };
      #       cursor = { text = "#303446"; cursor = "#f2d5cf"; };
      #       vi_mode_cursor = { text = "#303446"; cursor = "#babbf1"; };
      #       search = { matches = { foreground = "#303446"; background = "#a5adce"; }; focused_match = { foreground = "#303446"; background = "#a6d189"; }; };
      #       footer_bar = { foreground = "#303446"; background = "#a5adce"; };
      #       hints = { start = { foreground = "#303446"; background = "#e5c890"; }; end = { foreground = "#303446"; background = "#a5adce"; }; };
      #       selection = { text = "#303446"; background = "#f2d5cf"; };
      #       normal = { black = "#51576d"; red = "#e78284"; green = "#a6d189"; yellow = "#e5c890"; blue = "#8caaee"; magenta = "#f4b8e4"; cyan = "#81c8be"; white = "#b5bfe2"; };
      #       bright = { black = "#626880"; red = "#e78284"; green = "#a6d189"; yellow = "#e5c890"; blue = "#8caaee"; magenta = "#f4b8e4"; cyan = "#81c8be"; white = "#a5adce"; };
      #       indexed_colors = [ { index = 16; color = "#ef9f76"; } { index = 17; color = "#f2d5cf"; } ];
      #     };
      #     latte = {
      #       primary = { background = "#eff1f5"; foreground = "#4c4f69"; dim_foreground = "#8c8fa1"; bright_foreground = "#4c4f69"; };
      #       cursor = { text = "#eff1f5"; cursor = "#dc8a78"; };
      #       vi_mode_cursor = { text = "#eff1f5"; cursor = "#7287fd"; };
      #       search = { matches = { foreground = "#eff1f5"; background = "#6c6f85"; }; focused_match = { foreground = "#eff1f5"; background = "#40a02b"; }; };
      #       footer_bar = { foreground = "#eff1f5"; background = "#6c6f85"; };
      #       hints = { start = { foreground = "#eff1f5"; background = "#df8e1d"; }; end = { foreground = "#eff1f5"; background = "#6c6f85"; }; };
      #       selection = { text = "#eff1f5"; background = "#dc8a78"; };
      #       normal = { black = "#bcc0cc"; red = "#d20f39"; green = "#40a02b"; yellow = "#df8e1d"; blue = "#1e66f5"; magenta = "#ea76cb"; cyan = "#179299"; white = "#5c5f77"; };
      #       bright = { black = "#acb0be"; red = "#d20f39"; green = "#40a02b"; yellow = "#df8e1d"; blue = "#1e66f5"; magenta = "#ea76cb"; cyan = "#179299"; white = "#6c6f85"; };
      #       indexed_colors = [ { index = 16; color = "#fe640b"; } { index = 17; color = "#dc8a78"; } ];
      #     };
      #     macchiato = {
      #       primary = { background = "#24273a"; foreground = "#cad3f5"; dim_foreground = "#8087a2"; bright_foreground = "#cad3f5"; };
      #       cursor = { text = "#24273a"; cursor = "#f4dbd6"; };
      #       vi_mode_cursor = { text = "#24273a"; cursor = "#b7bdf8"; };
      #       search = { matches = { foreground = "#24273a"; background = "#a5adcb"; }; focused_match = { foreground = "#24273a"; background = "#a6da95"; }; };
      #       footer_bar = { foreground = "#24273a"; background = "#a5adcb"; };
      #       hints = { start = { foreground = "#24273a"; background = "#eed49f"; }; end = { foreground = "#24273a"; background = "#a5adcb"; }; };
      #       selection = { text = "#24273a"; background = "#f4dbd6"; };
      #       normal = { black = "#494d64"; red = "#ed8796"; green = "#a6da95"; yellow = "#eed49f"; blue = "#8aadf4"; magenta = "#f5bde6"; cyan = "#8bd5ca"; white = "#b8c0e0"; };
      #       bright = { black = "#5b6078"; red = "#ed8796"; green = "#a6da95"; yellow = "#eed49f"; blue = "#8aadf4"; magenta = "#f5bde6"; cyan = "#8bd5ca"; white = "#a5adcb"; };
      #       indexed_colors = [ { index = 16; color = "#f5a97f"; } { index = 17; color = "#f4dbd6"; } ];
      #     };
      #     mocha = {
      #       primary = { background = "#1e1e2e"; foreground = "#cdd6f4"; dim_foreground = "#7f849c"; bright_foreground = "#cdd6f4"; };
      #       cursor = { text = "#1e1e2e"; cursor = "#f5e0dc"; };
      #       vi_mode_cursor = { text = "#1e1e2e"; cursor = "#b4befe"; };
      #       search = { matches = { foreground = "#1e1e2e"; background = "#a6adc8"; }; focused_match = { foreground = "#1e1e2e"; background = "#a6e3a1"; }; };
      #       footer_bar = { foreground = "#1e1e2e"; background = "#a6adc8"; };
      #       hints = { start = { foreground = "#1e1e2e"; background = "#f9e2af"; }; end = { foreground = "#1e1e2e"; background = "#a6adc8"; }; };
      #       selection = { text = "#1e1e2e"; background = "#f5e0dc"; };
      #       normal = { black = "#45475a"; red = "#f38ba8"; green = "#a6e3a1"; yellow = "#f9e2af"; blue = "#89b4fa"; magenta = "#f5c2e7"; cyan = "#94e2d5"; white = "#bac2de"; };
      #       bright = { black = "#585b70"; red = "#f38ba8"; green = "#a6e3a1"; yellow = "#f9e2af"; blue = "#89b4fa"; magenta = "#f5c2e7"; cyan = "#94e2d5"; white = "#a6adc8"; };
      #       indexed_colors = [ { index = 16; color = "#fab387"; } { index = 17; color = "#f5e0dc"; } ];
      #     };
      #   };
      #   personal = {
      #     primary = { background = "#131313"; foreground = "#f0f0f0"; dim_foreground = "#888888"; bright_foreground = "#ffffff"; };
      #     cursor = { text = "#131313"; cursor = "#f0f0f0"; };
      #     selection = { text = "#131313"; background = "#72dec2"; };
      #     normal = { black = "#1c1c1c"; red = "#fd2d14"; green = "#72dec2"; yellow = "#ffb300"; blue = "#72dec2"; magenta = "#6364ff"; cyan = "#72dec2"; white = "#f0f0f0"; };
      #     bright = { black = "#4a4a4a"; red = "#dd0102"; green = "#72dec2"; yellow = "#fbc44b"; blue = "#72dec2"; magenta = "#9b5fe6"; cyan = "#72dec2"; white = "#ffffff"; };
      #     indexed_colors = [ { index = 16; color = "#f5a97f"; } { index = 17; color = "#f4dbd6"; } ];
      #   };
      # in catppuccin.latte;
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
          # post_processng = true;
          persist = false;
          mouse = {
            enabled = true;
            # mods = "<string>";
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
