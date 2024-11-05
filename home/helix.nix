{ pkgs, lib, inputs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {      
      theme = "catppuccin_macchiato";
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
          w = [ "move_next_word_start" "move_char_right" "collapse_selection" ];
          W = [ "move_next_long_word_start" "move_char_right" "collapse_selection" ];
          e = [ "move_next_word_end" "collapse_selection" ];
          E = [ "move_next_long_word_end" "collapse_selection" ];
          b = [ "move_prev_word_start" "collapse_selection" ];
          B = [ "move_prev_long_word_start" "collapse_selection" ];
          i = [ "insert_mode" "collapse_selection" ];
          a = [ "append_mode" "collapse_selection" ];
          u = [ "undo" "collapse_selection" ];
          p = "paste_clipboard_before";
          y = "yank_main_selection_to_clipboard";
          esc = [ "collapse_selection" "keep_primary_selection" ];
          "*" = [ "move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_next" ];
          "#" = [ "move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_prev"];
          A-S-up = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
          A-S-down = [ "extend_to_line_bounds" "delete_selection" "move_line_down" "paste_before" ];
          C-tab = ":buffer-next";
          C-S-tab = ":buffer-previous";
          A-w = ":buffer-close";
          C-o = ":config-open";
          C-r = ":config-reload";
          S-space = [ "half_page_up" ];
          space.c = "toggle_comments";
          space."." = "file_picker_in_current_buffer_directory";
          g.T = "find_till_char";
          # Engram layout
          # n = "move_char_right";
          # t = "move_visual_line_down";
          # s = "move_visual_line_up";
          # C-S = "select_regex";
          # C-N = "search_next";
          # C-T = "find_till_char";
        };
        insert.esc = [ "collapse_selection" "normal_mode" ];
        select = {
          "{" = [ "extend_to_line_bounds" "goto_prev_paragraph" ];
          "}" = [ "extend_to_line_bounds" "goto_next_paragraph" ];
          "0" = "goto_line_start";
          "$" = "goto_line_end";
          "^" = "goto_first_nonwhitespace";
          G = "goto_file_end";
          C = [ "goto_line_start" "extend_to_line_bounds" "change_selection" ];
          D = [ "extend_to_line_bounds" "delete_selection" "normal_mode" ];
          "%" = "match_brackets";
          S = "surround_add";
          u = [ "switch_to_lowercase" "collapse_selection" "normal_mode" ];
          U = [ "switch_to_uppercase" "collapse_selection" "normal_mode" ];
          d = [ "yank_main_selection_to_clipboard" "delete_selection" ];
          x = [ "yank_main_selection_to_clipboard" "delete_selection" ];
          y = [ "yank_main_selection_to_clipboard" "normal_mode" "flip_selections" "collapse_selection" ];
          Y = [ "extend_to_line_bounds" "yank_main_selection_to_clipboard" "goto_line_start" "collapse_selection" "normal_mode" ];
          p = [ "replace_selections_with_clipboard" ];
          P = [ "paste_clipboard_before" ];
          esc = [ "collapse_selection" "keep_primary_selection" "normal_mode" ];
          # Engram layout
          # C-S = "select_regex";
          # C-N = "search_next";
          # C-t = "find_till_char";
          # n = "extend_char_right";
          # s = "extend_visual_line_up";
          # t = "extend_visual_line_down";
        };
      };
    };
    languages = {
      language = [
        {
          name = "fish";
          language-servers = [ "fish-lsp" ];
        }
        {
          name = "go";
          language-servers = [ "golangci-lint-langserver" ];
        }
        {
          name = "nix";
          formatter.command = lib.getExe pkgs.alejandra;
        }
      ];
      language-server = {
        fish-lsp = {
          command = "fish-lsp";
          args = [ "start" ];
        };
        golangci-lint-langserver = {
          command = "golangci-lint-langserver";
          args = [ "--stdio" ];
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
          args = [ "--stdio" ];
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
          args = [ "--stdio" ];
        };
        copilot = {
          command = "helix-gpt";
          args = [ "--handler" "copilot" "--copilotApiKey" "" ];
        };
      };
    };
  }; 
}
