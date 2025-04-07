{ ... }:
{
  programs.zellij = {
    default_shell = "fish";
    on_force_close = "detach";
    simplified_ui = false;
    pane_frames = true;
    theme = "nord";
    default_layout = "default";
    default_mode = "normal";
    mouse_mode = true;
    scroll_buffer_size = 50000;
    copy_command = "pbcopy";
    copy_clipboard = "system";
    copy_on_select = false;
    scrollback_editor = "hx";
    mirror_session = false;
    # layout_dir = "";
    # theme_dir = "";
    env = {
      SHELL = "fish";
    };
    ui = {
      pane_frames = {
        rounded_corners = false;
        hide_session_name = false;
      };
    };
    auto_layout = true;
    styled_underlines = true; # Support for ANSI extended underlines stuff- might not work on some older computers
    session_serialization = true; # Cache sessions so that they can persist after reboot
    pane_viewport_serialization = true; # Cache text for session resurrection
    scrollback_lines_to_serialize = 100; # Only matters if papane_viewport_serialization is true
    disable_session_metadata = false; # Enable or disable writing of session data to disk.
  };
}
