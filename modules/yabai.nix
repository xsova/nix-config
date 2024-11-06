{ ... }:

{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      auto_balance = "on";
      mouse_modifier = "ctrl";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      top_padding = 32;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 10;
      window_placement = "second_child";
      window_topmost = "on";
      window_opacity = "on";
      focus_follows_mouse = "autoraise";
      mouse_follows_focus = "false";
      debug_output = "false";
      active_window_opacity = 1.0;
      normal_window_opacity = 0.90;
      window_opacity_duration = 0.0;
      split_ratio = 0.50;
      window_shadow = "off";
      window_animation_duration = 0.0;
    };
    extraConfig = '' 
      sudo yabai --load-sa

      yabai -m signal --add event=space_changed action="yabai -m window --focus first"
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      yabai -m config external_bar all:0:26

      function mkSpace { # Create spaces on startup
        local i="$1"
        local label="$2"
        local space=
        space=$(yabai -m query --spaces --space "$i")
        if [ -z "$space" ]; then
          yabai -m space --create
        fi
        yabai -m space "$i" --label "$label"
      }

      mkSpace 1  Home
      mkSpace 2  Terminal
      mkSpace 3  Browser
      mkSpace 4  Teams
      mkSpace 5  Email
      mkSpace 6  Music
      mkSpace 7  SocialMedia
      mkSpace 8  WorkCode
      mkSpace 9  WorkTerminal
      mkSpace 10 WorkBrowser

      for _ in $(yabai -m query --spaces | jq '.[].index | select(. > 6)'); do
        yabai -m space --destroy 11
      done

      yabai -m rule --add app="^Arc$" title="" manage=off # hopefully this works.
      yabai -m rule --add app="^Arc$" space=^3
      yabai -m rule --add app="^Aqua$" title="^Settings$" manage=off
      yabai -m rule --add app="^Chromium$" title="^Playwright Inspector$" space=^7
      yabai -m rule --add app="^Chromium$" space=^8
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add app="Chromium" manage=off
      yabai -m rule --add title="Playwright Inspector" space=^2 manage=off
      yabai -m rule --add app="^(LuLu|Calculator|Software Update|Dictionary|VLC|System Preferences|System Settings|zoom.us|Photo Booth|Archive Utility|Python|LibreOffice|App Store|Steam|Alfred|Activity Monitor)$" manage=off
      yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
      yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
      yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
    '';
  };
}

