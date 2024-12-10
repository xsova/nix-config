{
  pkgs,
  lib,
  ...
}: {
  enable = true;
  settings = {
    theme = "fleet_dark";
    editor = {
      mouse = true;
      auto-save = true;
      cursorline = false;
      cursorcolumn = false;
      cursor-shape = {
        insert = "block";
        normal = "block";
        select = "underline";
      };
      lsp.display-messages = true;
      file-picker.hidden = false;
    };
    keys = {
      normal = {
        w = ["move_next_word_start" "move_char_right" "collapse_selection"];
        W = ["move_next_long_word_start" "move_char_right" "collapse_selection"];
        e = ["move_next_word_end" "collapse_selection"];
        E = ["move_next_long_word_end" "collapse_selection"];
        b = ["move_prev_word_start" "collapse_selection"];
        B = ["move_prev_long_word_start" "collapse_selection"];
        i = ["insert_mode" "collapse_selection"];
        a = ["append_mode" "collapse_selection"];
        u = ["undo" "collapse_selection"];
        y = "yank_main_selection_to_clipboard";
        esc = ["collapse_selection" "keep_primary_selection"];
        "*" = ["move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_next"];
        "#" = ["move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_prev"];
        A-S-up = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
        A-S-down = ["extend_to_line_bounds" "delete_selection" "move_line_down" "paste_before"];
        C-tab = ":buffer-next";
        C-S-tab = ":buffer-previous";
        A-w = ":buffer-close";
        C-o = ":config-open";
        C-r = ":config-reload";
        S-space = ["half_page_down"];
        A-space = ["half_page_up"];
        C-C = ["toggle_comments" "move_visual_line_down"]; # Move down a line after commenting
        space = {
          c = ["toggle_comments"];
          "." = ["file_picker_in_current_buffer_directory"];
          t = ":format";
          n = ["search_next"];
          N = ["search_prev"];
        };
        g = {
          space = "page_down";
          backspace = "page_up";
        };
        # Engram layout
        h = "move_char_left";
        H = "goto_line_start";
        n = "move_char_right";
        N = "goto_line_end";
        t = "move_visual_line_down";
        T = "half_page_down";
        s = "move_visual_line_up";
        S = "half_page_up";
        p = "select_regex"; # 'p'ickError: Could not get runtime dependencies from /opt/homebrew/Library/Taps/qmk/homebrew-qmk/Formula/qmk.rb!
      };
      insert.esc = ["collapse_selection" "normal_mode"];
      select = {
        "{" = ["extend_to_line_bounds" "goto_prev_paragraph"];
        "}" = ["extend_to_line_bounds" "goto_next_paragraph"];
        "0" = "goto_line_start";
        "$" = "goto_line_end";
        "^" = "goto_first_nonwhitespace";
        G = "goto_file_end";
        C = ["goto_line_start" "extend_to_line_bounds" "change_selection"];
        D = ["extend_to_line_bounds" "delete_selection" "normal_mode"];
        "%" = "match_brackets";
        S = "surround_add";
        u = ["switch_to_lowercase" "collapse_selection" "normal_mode"];
        U = ["switch_to_uppercase" "collapse_selection" "normal_mode"];
        d = ["yank_main_selection_to_clipboard" "delete_selection"];
        x = ["yank_main_selection_to_clipboard" "delete_selection"];
        y = ["yank_main_selection_to_clipboard" "normal_mode" "flip_selections" "collapse_selection"];
        Y = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "goto_line_start" "collapse_selection" "normal_mode"];
        p = ["replace_selections_with_clipboard"];
        esc = ["collapse_selection" "keep_primary_selection" "normal_mode"];
        # Engram layout
        P = "select_regex";
        H = "extend_to_line_start";
        n = "extend_char_right";
        N = "extend_to_line_end";
        s = "extend_visual_line_up";
        t = "extend_visual_line_down";
      };
    };
  };
  languages = {
    language = [
      {
        name = "modal";
        file-types = ["mdl" "modal" "ml"];
        shebangs = ["modal" "/usr/bin/env modal"];
        indent = {
         tab-width = 4;
         unit = " ";
        };
        scope = "source.modal";
      }
      {
        name = "fish";
        language-servers = ["fish-lsp"];
      }
      {
        name = "go";
        language-servers = ["golangci-lint-langserver"];
      }
      {
        name = "nix";
        formatter.command = lib.getExe pkgs.alejandra;
      }
      {
        name = "python";
        language-servers = ["pyright" "ruff" "pylyzer"];
      }
      {
        name = "zig";
        indent = {
          tab-width = 4;
          unit = " ";
        };
      }
      {
        name = "typescript";
        indent = {
          tab-width = 4;
          unit = " ";
        };
      }
    ];
    language-server = {
      rust-analyzer = {
        command = lib.getExe pkgs.clippy;
      };
      pyright = {
        config.python.analysis.typeCheckingMode = "basic";
      };
      ruff = {
        command = lib.getExe pkgs.ruff;
        args = ["server"];
      };
      pylyzer = {
        command = lib.getExe pkgs.pylyzer;
        args = ["--server"];
      };
      fish-lsp = {
        command = "fish-lsp";
        args = ["start"];
      };
      golangci-lint-langserver = {
        command = "golangci-lint-langserver";
        args = ["--stdio"];
      };
      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.nix = {
          binary = lib.getExe pkgs.nix;
          flake = {
            autoEvalInputs = true;
          };
        };
      };
      eslint = {
        command = "golangci-lint-langserver";
        args = ["--stdio"];
        config = {
          format = true;
          nodePath = "";
          onIgnoredFiles = "off";
          packageManager = "npm";
          quiet = false;
          run = "onType";
          useESLintClass = "false";
          validate = "on";
          codeAction = {
            disableRuleComment = {
              enable = true;
              location = "separateLine";
            };
          };
          codeActionOnSave.mode = "all";
          problems.shortenToSingleLine = false;
          workingDirectory.mode = "auto";
        };
      };
      emmet-lsp = {
        command = "emmet-language-server";
        args = ["--stdio"];
      };
      copilot = {
        command = "helix-gpt";
        args = ["--handler" "copilot" "--copilotApiKey" ""];
      };
    };
    grammar = {
      grammar = [
        {
          name = "lua";
          source = {
            git = "https://github.com/MuniTanjim/tree-sitter-lua";
            rev = "887dfd4e83c469300c279314ff1619b1d0b85b91";
          };
        }
      ];
    };
  };
}
