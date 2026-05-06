{
  pkgs,
  lib,
  ...
}:
{
  enable = true;
  settings = {
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
      lsp = {
        enable = true;
        display-messages = true;
        auto-signature-help = false;
        display-inlay-hints = false;
        display-signature-help-docs = true;
        snippets = true;
        goto-reference-include-declaration = true;
      };
      file-picker.hidden = false;
    };
    keys = {
      normal = {
        w = [
          "move_next_word_start"
          "move_char_right"
          "collapse_selection"
        ];
        W = [
          "move_next_long_word_start"
          "move_char_right"
          "collapse_selection"
        ];
        e = [
          "move_next_word_end"
          "collapse_selection"
        ];
        E = [
          "move_next_long_word_end"
          "collapse_selection"
        ];
        b = [
          "move_prev_word_start"
          "collapse_selection"
        ];
        B = [
          "move_prev_long_word_start"
          "collapse_selection"
        ];
        i = [
          "insert_mode"
          "collapse_selection"
        ];
        a = [
          "append_mode"
          "collapse_selection"
        ];
        u = [
          "undo"
          "collapse_selection"
        ];
        y = "yank_main_selection_to_clipboard";
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        "*" = [
          "move_char_right"
          "move_prev_word_start"
          "move_next_word_end"
          "search_selection"
          "search_next"
        ];
        "#" = [
          "move_char_right"
          "move_prev_word_start"
          "move_next_word_end"
          "search_selection"
          "search_prev"
        ];
        C-A-s = "split_selection_on_newline";
        A-S-up = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];
        A-S-down = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_down"
          "paste_before"
        ];
        C-tab = ":buffer-next";
        C-S-tab = ":buffer-previous";
        A-w = ":buffer-close";
        C-o = ":config-open";
        C-r = ":config-reload";
        S-space = [ "half_page_down" ];
        A-space = [ "half_page_up" ];
        C-C = [
          "toggle_comments"
          "move_visual_line_down"
        ]; # Move down a line after commenting
        space = {
          c = [ "toggle_comments" ];
          "." = [ "file_picker_in_current_buffer_directory" ];
          t = ":format";
          n = [ "search_next" ];
          N = [ "search_prev" ];
        };
        g = {
          space = "half_page_down";
          backspace = "half_page_up";
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
        p = "select_regex";
      };
      insert.esc = [
        "collapse_selection"
        "normal_mode"
      ];
      select = {
        "{" = [
          "extend_to_line_bounds"
          "goto_prev_paragraph"
        ];
        "}" = [
          "extend_to_line_bounds"
          "goto_next_paragraph"
        ];
        "0" = "goto_line_start";
        "$" = "goto_line_end";
        "^" = "goto_first_nonwhitespace";
        G = "goto_file_end";
        C = [
          "goto_line_start"
          "extend_to_line_bounds"
          "change_selection"
        ];
        D = [
          "extend_to_line_bounds"
          "delete_selection"
          "normal_mode"
        ];
        "%" = "match_brackets";
        S = "surround_add";
        u = [
          "switch_to_lowercase"
          "collapse_selection"
          "normal_mode"
        ];
        U = [
          "switch_to_uppercase"
          "collapse_selection"
          "normal_mode"
        ];
        d = [
          "yank_main_selection_to_clipboard"
          "delete_selection"
        ];
        x = [
          "yank_main_selection_to_clipboard"
          "delete_selection"
        ];
        y = [
          "yank_main_selection_to_clipboard"
          "normal_mode"
          "flip_selections"
          "collapse_selection"
        ];
        Y = [
          "extend_to_line_bounds"
          "yank_main_selection_to_clipboard"
          "goto_line_start"
          "collapse_selection"
          "normal_mode"
        ];
        p = [ "replace_selections_with_clipboard" ];
        esc = [
          "collapse_selection"
          "keep_primary_selection"
          "normal_mode"
        ];
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
        name = "java";
        scope = "source.java";
        injection-regex = "java";
        file-types = [ "java" ];
        roots = [ "pom.xml" ];
        language-servers = [ "jdtls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "sql";
        scope = "source.sql";
        file-types = [ "sql" ];
        roots = [ ];
        comment-token = "--";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
        injection-regex = "sql";
      }
      {
        name = "fish";
        language-servers = [ "fish-lsp" ];
      }
      {
        name = "go";
        scope = "source.go";
        injection-regex = "go";
        file-types = [ "go" ];
        roots = [
          "Gopkg.toml"
          "go.mod"
        ];
        auto-format = true;
        comment-token = "//";
        language-servers = [ "gopls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "lua";
        scope = "source.lua";
        file-types = [ "lua" ];
        shebangs = [ "lua" ];
        roots = [
          ".luarc.json"
          ".luacheckrc"
          ".stylua.toml"
          "selene.toml"
          ".git"
        ];
        comment-token = "--";
        indent = {
          tab-width = 2;
          unit = "  ";
        };
        language-servers = [ "lua-language-server" ];
      }
      {
        name = "nix";
        language-servers = [ "nixd" ];
        auto-format = true;
      }
      {
        name = "python";
        language-servers = [
          "pyright"
          "pylyzer"
        ];
      }
      {
        name = "zig";
        scope = "source.zig";
        injection-regex = "zig";
        file-types = [ "zig" ];
        roots = [ "build.zig" ];
        auto-format = true;
        language-servers = [ "zls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
        formatter = {
          command = "zig";
          args = [
            "fmt"
            "--stdin"
          ];
        };
      }
      {
        name = "typescript";
        scope = "source.ts";
        injection-regex = "(ts|typescript)";
        language-id = "typescript";
        file-types = [
          "ts"
          "mts"
          "cts"
        ];
        shebangs = [
          "deno"
          "node"
          "bun"
          "ts-node"
        ];
        roots = [
          "deno.json"
          "package.json"
          "tsconfig.json"
        ];
        language-servers = [ "typescript-language-server" ];
        auto-format = true;
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
      {
        name = "cmake";
        scope = "source.cmake";
        file-types = [
          "cmake"
          "CMakeLists.txt"
        ];
        roots = [ ];
        comment-token = "#";
        # language-servers = [ "cmake-language-server" ];
        injection-regex = "cmake";
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
      {
        name = "make";
        scope = "source.make";
        file-types = [
          "Makefile"
          "makefile"
          "mk"
          "justfile"
          ".justfile"
        ];
        injection-regex = "(make|makefile|Makefile|mk|just)";
        roots = [ ];
        comment-token = "#";
        indent = {
          tab-width = 4;
          unit = "\t";
        };
      }
      {
        name = "yaml";
        scope = "source.yaml";
        file-types = [
          "yml"
          "yaml"
        ];
        roots = [ ];
        comment-token = "#";
        language-servers = [ "yaml-language-server" ];
        injection-regex = "yml|yaml";
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
      {
        name = "bash";
        scope = "source.bash";
        injection-regex = "(shell|bash|zsh|sh)";
        file-types = [
          "sh"
          "bash"
          "zsh"
          ".bash_login"
          ".bash_logout"
          ".bash_profile"
          ".bashrc"
          ".profile"
          ".zshenv"
          ".zlogin"
          ".zlogout"
          ".zprofile"
          ".zshrc"
          "APKBUILD"
          "PKGBUILD"
          "eclass"
          "ebuild"
          "bazelrc"
        ];
        shebangs = [
          "sh"
          "bash"
          "dash"
        ];
        roots = [ ];
        comment-token = "#";
        language-servers = [ "bash-language-server" ];
        auto-format = true;
        indent = {
          tab-width = 4;
          unit = "    ";
        };
        formatter = {
          command = lib.getExe pkgs.shfmt;
          args = [
            "-i"
            "4"
          ];
        };
      }
      # {
      #   name = "ruby";
      #   scope = "source.ruby";
      #   injection-regex = "ruby";
      #   file-types = [
      #     "rb"
      #     "rake"
      #     "rakefile"
      #     "irb"
      #     "gemfile"
      #     "gemspec"
      #     "Rakefile"
      #     "Gemfile"
      #     "rabl"
      #     "jbuilder"
      #     "jb"
      #   ];
      #   shebangs = [ "ruby" ];
      #   roots = [ ];
      #   comment-token = "#";
      #   language-servers = [ "solargraph" ];
      #   auto-format = true;
      #   indent = {
      #     tab-width = 2;
      #     unit = "  ";
      #   };
      #   formatter = {
      #     command = "bundle";
      #     args = [
      #       "exec"
      #       "rubocop"
      #       "--stdin"
      #       "foo.rb"
      #       "--fix"
      #       "--stderr"
      #       "--fail-level"
      #       "fatal"
      #     ];
      #   };
      # }
      {
        name = "javascript";
        scope = "source.js";
        injection-regex = "(js|javascript)";
        file-types = [
          "js"
          "mjs"
          "cjs"
        ];
        roots = [
          "package.json"
          "tsconfig.json"
        ];
        comment-token = "//";
        language-servers = [ "deno" ];
        indent = {
          tab-width = 2;
          unit = "  ";
        };
        formatter = {
          command = lib.getExe pkgs.prettier;
          args = [
            "fmt"
            "-"
            "--ext"
            "js"
          ];
        };
      }
      {
        name = "jsx";
        scope = "scope.jsx";
        injection-regex = "jsx";
        file-types = [ "jsx" ];
        shebangs = [
          "deno"
          "node"
        ];
        roots = [
          "deno.json"
          "package.json"
          "tsconfig.json"
        ];
        comment-token = "//";
        language-servers = [ "deno" ];
        grammar = "javascript";
        auto-format = true;
        indent = {
          tab-width = 2;
          unit = "  ";
        };
        formatter = {
          command = lib.getExe pkgs.deno;
          args = [
            "fmt"
            "-"
            "--ext"
            "jsx"
          ];
        };
      }
      {
        name = "tsx";
        scope = "source.tsx";
        injection-regex = "(tsx)";
        file-types = [ "tsx" ];
        shebangs = [
          "deno"
          "node"
        ];
        roots = [
          "deno.json"
          "package.json"
          "tsconfig.json"
        ];
        language-servers = [ "deno" ];
        auto-format = true;
        indent = {
          tab-width = 2;
          unit = "  ";
        };
        formatter = {
          command = lib.getExe pkgs.deno;
          args = [
            "fmt"
            "-"
            "--ext"
            "tsx"
          ];
        };
      }
    ];
    language-server = {
      typescript-language-server = {
        command = lib.getExe pkgs.typescript-language-server;
      };
      jdtls = {
        command = lib.getExe pkgs.jdt-language-server;
      };
      gopls = {
        command = lib.getExe pkgs.gopls;
      };
      lua-language-server = {
        command = lib.getExe pkgs.lua-language-server;
        args = [ ];
      };
      # cmake-language-server = {
      #   command = lib.getExe pkgs.cmake-language-server;
      # };
      bash-language-server = {
        command = lib.getExe pkgs.bash-language-server;
        args = [ "start" ];
      };
      # solargraph = {
      #   command = lib.getExe pkgs.solargraph;
      #   args = [ "stdio" ];
      # };
      deno = {
        command = lib.getExe pkgs.deno;
        args = [ "lsp" ];
      };
      rust-analyzer = {
        command = lib.getExe pkgs.clippy;
      };
      pyright = {
        config.python.analysis.typeCheckingMode = "basic";
      };
      pylyzer = {
        command = lib.getExe pkgs.pylyzer;
        args = [ "--server" ];
      };
      fish-lsp = {
        command = lib.getExe pkgs.fish-lsp;
        args = [ "start" ];
      };
      golangci-lint-langserver = {
        command = lib.getExe pkgs.golangci-lint-langserver;
        args = [ "--stdio" ];
      };
      nixd = {
        command = lib.getExe pkgs.nixd;
        args = [ "--semantic-tokens=true" ];
        config.nixd =
          let
            myFlake = "(builtins.getFlake (toString /Users/bryce/nix))";
            nixOpts = "${myFlake}.darwinConfigurations.port.options";
          in
          {
            nixpkgs.expr = "import ${myFlake}.inputs.nixpkgs { }";
            formatting.command = [ "nixfmt" ];
            options = {
              nixos.expr = nixOpts;
              home-manager.expr = "${nixOpts}.home-manager.users.type.getSubOptions []";
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
    };
  };
}
