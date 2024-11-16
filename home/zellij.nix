{ ... }: {
  programs.zellij = {
    default_shell = "fish";
    on_force_close = "detach";
    simplified_ui = false;
    pane_frames = true;
    theme = "catppuccin-frappe";
    default_layout = "default";
    default_mode = "normal";
    mouse_mode = true;
    scroll_buffer_size = 10000;
    copy_command = "pbcopy";
    copy_clipboard = "system";
    copy_on_select = false;
    scrollback_editor = "$EDITOR";
    mirror_session = false;
    # layout_dir = "";
    # theme_dir = "";
    env = {
      FOO = "bar";
    };
    ui = {
      pane_frames = {
        rounded_corners = true;
        hide_session_name = false;
      };
    };
    auto_layout = true;
    styled_underlines = true;
    session_serialization = true;
    pane_viewport_serialization = true; # Cache text for session resurrection
    scrollback_lines_to_serialize = 100; # Only matters if papane_viewport_serialization is true
    disable_session_metadata = false;
  };
}
