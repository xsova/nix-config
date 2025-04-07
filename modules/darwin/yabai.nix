{
  enable = true;
  enableScriptingAddition = true;
  config = {
    layout = "bsp";
    auto_balance = "on";
    mouse_modifier = "ctrl";
    mouse_action1 = "move";
    mouse_action2 = "resize";
    top_padding = 10;
    bottom_padding = 0;
    left_padding = 10;
    right_padding = 10;
    window_gap = 10;
    window_placement = "second_child";
    window_topmost = "on";
    window_opacity = "on";
    focus_follows_mouse = "autoraise";
    mouse_follows_focus = "true";
    debug_output = "false";
    active_window_opacity = 1.0;
    normal_window_opacity = 0.90;
    window_opacity_duration = 0.0;
    split_ratio = 0.50;
    window_shadow = "off";
    window_animation_duration = 0.0;
  };
  extraConfig =
    let
      rules = let
        jetbrainsApps = "^(Aqua|CLion|DataGrip|Datalore|Fleet|GoLand|Intellij IDEA|PhpStorm|PyCharm|ReSharper|Rider|RubyMine|WebStorm)$";
        appleApps = "^(LuLu|Calculator|Software Update|Dictionary|VLC|System Preferences|System Settings|zoom.us|Photo Booth|Archive Utility|Python|LibreOffice|App Store|Steam|Alfred|Activity Monitor)$";
      in ''
        yabai -m rule --add app="^Arc$" manage=off
        yabai -m rule --add app="^Arc$" title="^$" mouse_follows_focus=off
        yabai -m rule --add app="JetBrains Toolbox" manage=off
        yabai -m rule --add app="${jetbrainsApps}" manage=off
        yabai -m rule --add app="${jetbrainsApps}" title="^$" manage=on
        yabai -m rule --add app="${appleApps}" manage=off
        yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
        yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
        yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
        yabai -m rule --add app="Chromium" manage=off
        yabai -m rule --add app="DynamicLake Pro" manage=off
        yabai -m rule --add app="Microsoft Outlook" space=7
        yabai -m rule --add app="Microsoft Teams" space=6
      '';
      functions = ''

        # Create spaces for newly added display.
        setupSpacesForDisplay() {
          local display_id="$1"
          local space_count=$(yabai -m query --spaces | jq "[.[] | select(.display == $display_id)] | length")
          while [ "$space_count" -lt 10 ]; do
            yabai -m space --create --display $display_id
            space_count=$((space_count + 1))
          done
        }

        # Destroy spaces that were on the now-removed display.
        cleanupSpacesForDisplay() {
          local display_id="$1"
          yabai -m query --spaces | jq -r ".[] | select(.display == $display_id) | .index" | while read -r space; do
            yabai -m space $space --destroy
          done
        }

      '';
      signals = let
        arcSignalAction = ''

          app_name=$(yabai -m query --windows --window $YABAI_WINDOW_ID | jq -r ".app")
          if [ "$app_name" = "Arc" ]; then
            existing_windows=$(yabai -m query --windows | jq -r "[.[] | select(.app == \"Arc\")] | length")
            if [ "$existing_windows" -eq 1 ]; then
              yabai -m window $YABAI_WINDOW_ID --space 3 --toggle manage
            fi
          fi

        '';
      in ''

        yabai -m signal --add label=arc_first_window event=window_created action='${arcSignalAction}'
        yabai -m signal --add event=space_changed action="yabai -m window --focus first"
        yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
        yabai -m signal --add event=display_added action='setupSpacesForDisplay $YABAI_DISPLAY_ID'
        yabai -m signal --add event=display_removed action='cleanupSpacesForDisplay $YABAI_DISPLAY_ID'

      '';
      setupInitialSpaces = ''

        yabai -m query --displays | jq -r '.[].id' | while read -r display_id; do
          setupSpacesForDisplay "$display_id"
        done

      '';
    in ''
      sudo yabai --load-sa

      ${functions}
      ${signals}
      ${rules}

      ${setupInitialSpaces}
    '';
}
