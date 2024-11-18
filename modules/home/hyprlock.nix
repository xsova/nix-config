{ ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };
      background = {
        size = "200, 50";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        font_color = "";
        inner_color = "";
        outer_color = "";
        outline_thickness = 5;
        placeholder_text = '''';
        shadow_passes = 2;
      };
      sourceFirst = true; # Whether to enable putting source entries at the top of the configuration.
    }; # FIXME: finish this file
  };
}
