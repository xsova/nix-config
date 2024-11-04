{ ... }:

{
  services.jankyborders = {
    enable = true;
    active_color = "gradient(top_right=0xee33ccff,bottom_left=0xee00ff99)";
    ax_focus = false; # Slower accessibility API.
    background_color = "";
    blacklist = [];
    blur_radius = 5.0; # Blur radius applied to borders or backgrounds with transparency. Default: 0.0.
    hidpi = true;
    inactive_color = "0xaa595959";
    order = "above"; # Whether borders are drawn above or below windows (other option is "above").
    style = "round"; # Style of the border, can be either "round" (default) or square.
    whitelist = [];
    width = 2.0;
  };
}

