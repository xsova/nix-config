{
  pkgs,
  lib,
  host ? "test",
  ...
}: {
  enable = true;
  settings = {
    general = {
      working_directory = "None"; # Directory the shell is started in.
      live_config_reload = true; # Whether changes require restart.
      ipc_socket = true; # Unix only.
    };
    window = {
      dimensions = {
        # Number of lines/columns (not pixels) in the terminal.
        columns = 0;
        lines = 0;
      };
      position = "None"; # Window startup position. "None" | { x = <integer>; y = <integer>; }; (has no effect on Wayland)
      padding = {
        # Blank space added around the window in pixels.
        x = 10;
        y = 10;
      };
      dynamic_padding = false; # Default is false
      decorations = "Buttonless"; # Window decorations. "Full": Borders and title bar | "None": Neither borders nor title bar | "Transparent": Title bar, transparent (macOS) | "Buttonless": Title bar, transparent background and no title bar buttons. (macOS).
      opacity = 0.8; # Background opacity as a floating point number from 0.0 to 1.0.
      blur = true; # Request compositor to blur content behind transparent windows.
      startup_mode = "Windowed"; # Window mode on open. "Windowed" | "Maximized" | "Fullscreen" | "SimpleFullscreen" (macOS)
      title = "Alacritty"; # Window title.
      dynamic_title = true; # Allow terminal applications to change Alacritty's window title.
      class = {
        # Window class.
        instance = "Alacritty";
        general = "Alacritty";
      };
      decorations_theme_variant = "None"; # Override variant theme of the system theme/GTK theme/Wayland client side decorations. "Dark" | "Light" | "None"
      resize_increments = false; # Prefer resizing window by discrete steps equal to cell dimensions.
      option_as_alt = "Both"; # Make option key behave as alt (macOS)
    };
    scrolling = {
      history = 10000; # Maximum number of lines in the scrollback buffer.
      multiplier = 3; # Number of lines scrolled per scroll input.
    };
    font = {
      normal = {
        family = "MD IO Trial";
        style = "Regular";
      };
      bold = {
        family = "MD IO Trial";
        style = "Bold";
      };
      italic = {
        family = "MD IO Trial";
        style = "Italic";
      };
      bold_italic = {
        family = "MD IO Trial";
        style = "Bold Italic";
      };
      size =
        if host == "shell"
        then 12.0
        else if host == "core"
        then 11.0
        else 11.0; # Font size in points.
      offset = {
        x = 0;
        y = 0;
      }; # Extra space around each character. y can be thought as line spacing, and x as letter spacing.
      glyph_offset = {
        x = 0;
        y = 0;
      }; # Determines the locations of the glyphs within their cells with the default being at the bottom.
      builtin_box_drawing = true; # When true, Alacritty will use a custom built-in font for box drawing characters (U+2500-U+259F), legacy computing symbols (U+1FB00-U+1FB3B), and powerline symbols (U+E0B0-U+E0B3).
    };
    colors = {
      primary = {
        background = "#131313";
        foreground = "#f0f0f0";
        dim_foreground = "#888888";
        bright_foreground = "#ffffff";
      };
      cursor = {
        text = "#131313";
        cursor = "#f0f0f0";
      };
      selection = {
        text = "#131313";
        background = "#72dec2";
      };
      normal = {
        black = "#1c1c1c";
        red = "#fd2d14";
        # green = "#038554";
        green = "#72dec2";
        yellow = "#ffb300";
        # blue = "#076ce8";
        blue = "#72dec2";
        magenta = "#6364ff";
        cyan = "#72dec2";
        white = "#f0f0f0";
      };
      bright = {
        black = "#4a4a4a";
        red = "#dd0102";
        # green = "#1fc58c";
        green = "#72dec2";
        yellow = "#fbc44b";
        # blue = "#00c6d2";
        blue = "#72dec2";
        magenta = "#9b5fe6";
        # cyan = "#9ffce3";
        cyan = "#72dec2";
        white = "#ffffff";
      };
      indexed_colors = [
        {
          index = 16;
          color = "#f5a97f";
        }
        {
          index = 17;
          color = "#f4dbd6";
        }
      ];
    };
    bell = {
      animation = "Linear"; # Visual bell animations effect for flashing the screen when the visual bell is rung. "Ease" | "EaseOut" | "EaseOutSine" | "EaseOutQuad" | "EaseOutCubic" | "EaseOutQuart" | "EaseOutQuint" | "EaseOutExpo" | "EaseOutCirc" | "Linear"
      duration = 0; # Duration of the visual bell flash in milliseconds. A `duration` of `0` will disable the visual bell animation.
      color = "#ffffff"; # Visual bell animation color.
      command = "None"; # | { program = ""; args = [ "" ]; }; This program is executed whenever the bell is rung.
    };
    selection = {
      semantic_escape_chars = ",│`|:\"' ()[]{}<>\t"; # Contains all characters that are used as separators for 'semantic words' in Alacritty.
      save_to_clipboard = false; # Automatically copy selected text to primary clipboard.
    };
    cursor = {
      style = {
        shape = "Block"; # "Block" | "Underline" | "Beam"
        blinking = "On"; # "Never": Prevent the cursor from ever blinking | "Off": Disable blinking by default | "On": Enable blinking by default | "Always": Force the cursor to always blink.
      };
      vi_mode_style = "None"; # | { shape = ""; blinking = true | false; }; If the vi mode cursor style is "None" or not specified, it will fall back to the active value of the normal cursor.
      blink_interval = 750; # Cursor blinking interval in milliseconds.
      blink_timeout = 5; # Time after which cursor stops blinking, in seconds.
      unfocused_hollow = true; # When this is true, cursor will be rendered as a hollow box when the window is not focused.
      thickness = 0.15; # Thickness of cursor relative to cell width as floating point number between 0.0 - 1.0;
    };
    terminal = {
      shell = {
        program = "${lib.getExe pkgs.fish}"; # Path to your preferred shell. If unspecified, Linux/BSD/macOS: $SHELL, Windows: "powershell".
        args = ["-l"]; # Args passed to the shell's command.
      };
      osc52 = "OnlyCopy"; # Controls ability to write to the system clipboard with the osc 52 esc sequence. "Disabled" | "OnlyCopy" | "OnlyPaste" | "CopyPaste"
    };
    mouse = {
      hide_when_typing = false;
      # When an application running within alacritty captures the mouse, a modifier can be used to suppress mouse reporting.
      bindings = [
        {
          # If no action is found for the event, actions for the event without the modifier are triggered instead.
          mouse = "Right"; # "Middle" | "Left" | "Right" | "Back" | "Forward" | <integer>
          mods = "Control";
          action = "Paste"; # <keyboard.bindings.action> | "ExpandSelection" (expand selection to current mouse cursor location)
        }
      ];
    };
    hints = {
      # Terminal hints can be used to find text or hyperlinks in the visible part of the terminal and pipe it to other applications.
      alphabet = "jfkdls;ahgurieowpq"; # Keys used for the hint labels (this is the default value).
      enabled = [
        {
          command = "open"; # On macOS; Command that will be executed when the 'hint' is clicked or selected via the 'binding'.
          hyperlinks = true; # When this is true, all OSC 8 escape sequence hyperlinks will be included in the hints.
          # post_processng = true;                                                  # This is most useful for URIs and applies only to regex matches.
          persist = false; # When this is true, hints remain persistent after selection.
          mouse = {
            # Controls whether the hint should be underlined when hovering over the hint text with all 'mods' pressed.
            enabled = true;
            # mods = "<string>";                                                  # If a particular mod must be held down for the mouse interaction to be allowed.
          };
          binding = {
            # This controls which key binding is used to start the keyboard hint selection process. See: keyboard.bindings for available values.
            key = "O";
            mods = "Control|Shift";
          };
        }
      ];
    };
    keyboard = {
      bindings = []; # See alacritty-bindings(5) -- possible `action`s at bottom of file.
    };
    debug = {
      # Options for troubleshooting
      render_timer = false; # Display the time it takes to draw each frame.
      persistent_logging = false; # Keep the log file after quitting Alacritty.
      log_level = "Warn"; # "Off" | "Error" | "Warn" | "Info" | "Debug" | "Trace" - verbosity/logging info detail level
      renderer = "None"; # "glsl3" | "gles2" | "gles2pure" | "None" - Force use of a specific renderer, "None" will use highest available one.
      print_events = false; # Log all window events.
      highlight_damage = false; # Highlight window damage information.
      prefer_egl = false; # Use EGL as displayAPI if the current platform allows. Note that transparency may not work with EGL on Linux/BSD
    };
  };
}
# ReceiveChar: Allow receiving char input.
# None: No action.
# Paste: Paste contents of system clipboard.
# Copy: Store current selection into clipboard.
# IncreaseFontSize: Increase font size.
# DecreaseFontSize: Decrease font size.
# ResetFontSize: Reset font size to the config value.
# ScrollPageUp: Scroll exactly one page up.
# ScrollPageDown: Scroll exactly one page down.
# ScrollHalfPageUp: Scroll half a page up.
# ScrollHalfPageDown: Scroll half a page down.
# ScrollLineUp: Scroll one line up.
# ScrollLineDown: Scroll one line down.
# ScrollToTop: Scroll all the way to the top.
# ScrollToBottom: Scroll all the way to the bottom.
# ClearHistory: Clear the display buffer(s) to remove history.
# Hide: Hide the Alacritty window.
# Minimize: Minimize the Alacritty window.
# Quit: Quit Alacritty.
# ClearLogNotice: Clear warning and error notices.
# SpawnNewInstance: Spawn a new instance of Alacritty.
# CreateNewWindow: Create a new Alacritty window.
# ToggleFullscreen: Toggle fullscreen.
# ToggleMaximized: Toggle maximized.
# ClearSelection: Clear active selection.
# ToggleViMode: Toggle vi mode.
# SearchForward: Start a forward buffer search.
# SearchBackward: Start a backward buffer search.
# Up: Move up.
# Down: Move down.
# Left: Move left.
# Right: Move right.
# First: First column, or beginning of the line when already at the first column.
# Last: Last column, or beginning of the line when already at the last column.
# FirstOccupied: First non-empty cell in this terminal row, or first non-empty cell of the line when already at the first cell of the row.
# High: Move to top of screen.
# Middle: Move to center of screen.
# Low: Move to bottom of screen.
# SemanticLeft: Move to start of semantically separated word.
# SemanticRight: Move to start of next semantically separated word.
# SemanticLeftEnd: Move to end of previous semantically separated word.
# SemanticRightEnd: Move to end of semantically separated word.
# WordLeft: Move to start of whitespace separated word.
# WordRight: Move to start of next whitespace separated word.
# WordLeftEnd: Move to end of previous whitespace separated word.
# WordRightEnd: Move to end of whitespace separated word.
# Bracket: Move to opposing bracket.
# ToggleNormalSelection: Toggle normal vi selection.
# ToggleLineSelection: Toggle line vi selection.
# ToggleBlockSelection: Toggle block vi selection.
# ToggleSemanticSelection: Toggle semantic vi selection.
# SearchNext: Jump to the beginning of the next match.
# SearchPrevious: Jump to the beginning of the previous match.
# SearchStart: Jump to the next start of a match to the left of the origin.
# SearchEnd: Jump to the next end of a match to the right of the origin.
# Open: Launch the URL below the vi mode cursor.
# CenterAroundViCursor: Centers the screen around the vi mode cursor.
# InlineSearchForward: Search forward within the current line.
# InlineSearchBackward: Search backward within the current line.
# InlineSearchForwardShort: Search forward within the current line, stopping just short of the character.
# InlineSearchBackwardShort: Search backward within the current line, stopping just short of the character.
# InlineSearchNext: Jump to the next inline search match.
# InlineSearchPrevious: Jump to the previous inline search match.
# SearchFocusNext: Move the focus to the next search match.
# SearchFocusPrevious: Move the focus to the previous search match.
# SearchConfirm: Confirm the active search.
# SearchCancel: Cancel the active search.
# SearchClear: Reset the search regex.
# SearchDeleteWord: Delete the last word in the search regex.
# SearchHistoryPrevious: Go to the previous regex in the search history.
# SearchHistoryNext: Go to the next regex in the search history.
# ToggleSimpleFullscreen: Enter fullscreen without occupying another space.
# HideOtherApplications: Hide all windows other than Alacritty.
# CreateNewTab: Create new window in a tab.
# SelectNextTab: Select next tab.
# SelectPreviousTab: Select previous tab.
# SelectTab1: Select the first tab.
# SelectTab2: Select the second tab.
# SelectTab3: Select the third tab.
# SelectTab4: Select the fourth tab.
# SelectTab5: Select the fifth tab.
# SelectTab6: Select the sixth tab.
# SelectTab7: Select the seventh tab.
# SelectTab8: Select the eighth tab.
# SelectTab9: Select the ninth tab.
# SelectLastTab: Select the last tab.
# CopySelection: Copy from the selection buffer.
# PasteSelection: Paste from the selection buffer.

