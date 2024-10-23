{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
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
        dynamic_padding = false; # Default is false
        decorations = "None";
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
        option_as_alt = "Both"; # Default "None"
      };
    };
  };
}
