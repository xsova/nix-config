{ ... }:

{
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";
      auto_balance = "on";
      mouse_modifier = "ctrl";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 10;
      window_placement = "second_child";
      window_topmost = "on";
    };
    extraConfig = '' 
      yabai -m rule --add app="Mullvad Browser" manage=off
      yabai -m rule --add app="Chromium" manage=off
      yabai -m rule --add title="Playwright Inspector" manage=on
    '';
  };
}
