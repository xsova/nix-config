{ pkgs, ... }:
{
  services = {
    jankyborders = {
      enable = true;
      active_color = "0xaaffffff";
      ax_focus = false;
      background_color = "";
      blacklist = [ ];
      blur_radius = 5.0;
      hidpi = true;
      inactive_color = "0xaa595959";
      order = "above";
      style = "round";
      whitelist = [ ];
      width = 1.0;
    };
    yabai = {
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
          rules =
            let
              jetbrainsApps = "^(Aqua|CLion|DataGrip|Datalore|Fleet|GoLand|Intellij IDEA|PhpStorm|PyCharm|ReSharper|Rider|RubyMine|WebStorm)$";
              appleApps = "^(LuLu|Calculator|Software Update|Dictionary|VLC|System Preferences|System Settings|zoom.us|Photo Booth|Archive Utility|Python|LibreOffice|App Store|Steam|Alfred|Activity Monitor)$";
            in
            ''
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
          signals =
            let
              arcSignalAction = ''
                app_name=$(yabai -m query --windows --window $YABAI_WINDOW_ID | jq -r ".app")
                if [ "$app_name" = "Arc" ]; then
                  existing_windows=$(yabai -m query --windows | jq -r "[.[] | select(.app == \"Arc\")] | length")
                  if [ "$existing_windows" -eq 1 ]; then
                    yabai -m window $YABAI_WINDOW_ID --space 3 --toggle manage
                  fi
                fi
              '';
            in
            ''
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
        in
        ''
          sudo yabai --load-sa

          ${functions}
          ${signals}
          ${rules}

          ${setupInitialSpaces}
        '';
    };
    skhd = {
      enable = true;
      skhdConfig = ''
        # Launch applications
        cmd - return : ${pkgs.alacritty}/bin/alacritty

        # Changed focused display
        # ctrl + alt - 1       : yabai -m display --focus 1
        # ctrl + alt - 2       : yabai -m display --focus 2
        # ctrl + alt - 3       : yabai -m display --focus 3

        # Move window to display
        ctrl + alt + shift - 1 : yabai -m window --display 1
        ctrl + alt + shift - 2 : yabai -m window --display 2
        ctrl + alt + shift - 3 : yabai -m window --display 3

        ctrl + alt - h         : yabai -m display --focus west
        ctrl + alt - t         : yabai -m display --focus south
        ctrl + alt - j         : yabai -m display --focus south
        ctrl + alt - s         : yabai -m display --focus north
        ctrl + alt - k         : yabai -m display --focus north
        ctrl + alt - n         : yabai -m display --focus east
        ctrl + alt - l         : yabai -m display --focus east

        # Change spaces
        alt - 1                : yabai -m space --switch 1
        alt - 2                : yabai -m space --switch 2
        alt - 3                : yabai -m space --switch 3
        alt - 4                : yabai -m space --switch 4
        alt - 5                : yabai -m space --switch 5
        alt - 6                : yabai -m space --switch 6
        alt - 7                : yabai -m space --switch 7
        alt - 8                : yabai -m space --switch 8
        alt - 9                : yabai -m space --switch 9
        alt - 0                : yabai -m space --switch 10

        # Move window to space
        alt + ctrl - 1         : yabai -m window --space 1
        alt + ctrl - 2         : yabai -m window --space 2
        alt + ctrl - 3         : yabai -m window --space 3
        alt + ctrl - 4         : yabai -m window --space 4
        alt + ctrl - 5         : yabai -m window --space 5
        alt + ctrl - 6         : yabai -m window --space 6
        alt + ctrl - 7         : yabai -m window --space 7
        alt + ctrl - 8         : yabai -m window --space 8
        alt + ctrl - 9         : yabai -m window --space 9
        alt + ctrl - 0         : yabai -m window --space 10

        # Focus window
        alt - h                : yabai -m window --focus west  || $(yabai -m display --focus west  )
        alt - t                : yabai -m window --focus south || $(yabai -m display --focus south )
        alt - j                : yabai -m window --focus south || $(yabai -m display --focus south )
        alt - s                : yabai -m window --focus north || $(yabai -m display --focus north )
        alt - k                : yabai -m window --focus north || $(yabai -m display --focus north )
        alt - n                : yabai -m window --focus east  || $(yabai -m display --focus east  )
        alt - l                : yabai -m window --focus east  || $(yabai -m display --focus east  )

        # Swap window
        alt + shift - h        : yabai -m window --swap west  || $(yabai -m window --display west  )
        alt + shift - t        : yabai -m window --swap south || $(yabai -m window --display south )
        alt + shift - j        : yabai -m window --swap south || $(yabai -m window --display south )
        alt + shift - s        : yabai -m window --swap north || $(yabai -m window --display north )
        alt + shift - k        : yabai -m window --swap north || $(yabai -m window --display north )
        alt + shift - n        : yabai -m window --swap east  || $(yabai -m window --display east  )
        alt + shift - l        : yabai -m window --swap east  || $(yabai -m window --display east  )

        # Rotate Space
        alt - r                : yabai -m space --rotate 90

        # Move floating window
        alt + ctrl - return    : yabai -m window --toggle float --grid 1:1:0:0:1:1 # Full screen
        alt + ctrl - left      : yabai -m window --toggle float --grid 1:2:0:0:1:1 # Left half
        alt + ctrl - right     : yabai -m window --toggle float --grid 1:2:1:0:1:1 # Right half
        alt + ctrl - up        : yabai -m window --toggle float --grid 2:1:0:0:1:1 # Top half
        alt + ctrl - down      : yabai -m window --toggle float --grid 2:1:1:0:1:1 # Bottom half
      '';
    };
  };
}
