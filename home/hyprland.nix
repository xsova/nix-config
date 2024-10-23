{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
      hyprbars
      hyprexpo
    ];
    systemd = {
      variables = [ "--all" ]; extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
    settings = {
      "$mod" = "SUPER";
      # general = {
      #   gaps_in = 5;
      #   gaps_out = 5;
      #   border_size = 1;
      #   "col.active_border"   = "rgba(88888888)";
      #   "col.inactive_border" = "rgba(00000088)";
      #   allow_tearing = true;
      #   resize_on_border = true;
      #   lock_cmd = "pidof hyprlock || hyprlock";
      #   before_sleep_command = "loginctl lock-session";
      #   after_sleep_command = "hyprctl dispatch dpms on";
      # };
      # listener = {
      #   timeout = 180;
      #   on-timeout = "brightnessctl -s set 15%";
      #   on-resume = "brightnessctl -r";
      # };
      decoration = {
        rounding = 16;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;
          vibrancy = 0.2;
          vibrancy_darkness = 0.5;
          passes = 4;
          size = 7;
          popups = true;
          popups_ignorealpha = 0.2;
        };
        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "0 15";
        shadow_range = 100;
        shadow_scale = 0.97;
        "col.shadow" = "rgba(00000055)";
      };
      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 2, default, slide"
        ];
      };
      # group = {
      #   groupbar = {
      #     font_size = 10;
      #     gradients = false;
      #   };
      # };
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        accel_profile = "flat";
        touchpad.scroll_factor = 0.1;
      };
      misc = {
        disable_autoreload = false;
        force_default_wallpaper = 0;
        animate_mouse_windowdragging = true;
        # variable refresh rate
        vrr = 1;
      };
      render.direct_scanout = true;
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };
      debug.disable_logs = false;
      plugin = {
        # hyprbars = {
        #   bar_height = 20;
        #   bar_precedence_over_border = true;
        #   hyprbars-button = [
        #     "rgb()"
        #   ];
        };
        # hyprexpo = {
        #   columns = 3;
        #   gap_size = 4;
        #   bg_col = "rgb(00000000)";
        #   enable_gesture = true;
        #   gesture_distance = 300;
        #   gesture_positive = false;
        # };
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
      bind = [
        "$mod, F, exec, firefox"
        "$mod, RETURN, exec, wezterm start --always-new-process"
        "$mod, D, exec, rofi -show drun"
        "$mod, Q, killactive"
        "$mod, G, togglegroup"
        "$mod SHIFT, N, changegroupactive, f"
        "$mod SHIFT, P, changegroupactive, b"
        "$mod, R, togglesplit,"
        "$mod, T, togglefloating"
        "$mod, P, pseudo,"
        "$mod ALT, , resizeactive"
        "ALT, left, movefocus, l"
        "ALT, right, movefocus, r"
        "ALT, up, movefocus, u"
        "ALT, down, movefocus, d"
        "CTRL, left, movetoworkspace, m-1"
        "CTRL, right, movetoworkspace, m+1"
        ", XF86AudioPlay, exec, playerctl play-pause"
      ] ++ (
        # workspaces
        # binds $mod + shift + {1 .. 10} to move to workspace {1 .. 10}
        builtins.concatLists ( builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
      );
      };
    };
}
