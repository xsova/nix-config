{
  pkgs,
  lib,
  ...
}:
{
  extraPackages = with pkgs; [
    typescript-language-server
  ];
  enable = true;
  settings = {
    theme = "modus_vivendi";
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
        scope = "source.nix";
        injection-regex = "nix";
        file-types = [ "nix" ];
        shebangs = [ ];
        roots = [ ];
        language-servers = [ "nil" ];
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
      {
        name = "python";
        language-servers = [
          "pyright"
          "pylyzer"
        ];
      }
      {
        name = "fortran";
        scope = "source.fortran";
        injection-regex = "fortran";
        file-types = [
          "f"
          "for"
          "f90"
          "f95"
          "f03"
        ];
        roots = [ "fpm.toml" ];
        comment-token = "!";
        language-servers = [ "fortls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "odin";
        auto-format = false;
        scope = "source.odin";
        file-types = [ "odin" ];
        roots = [ "ols.json" ];
        language-servers = [ "ols" ];
        comment-token = "//";
        indent = {
          tab-width = 4;
          unit = "\t";
        };
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
        # block-comment-tokens = {
        #   start = "/*";
        #   end = "*/";
        # };
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
        language-servers = [ "cmake-language-server" ];
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
        name = "haskell";
        scope = "source.haskell";
        injection-regex = "haskell";
        file-types = [ "hs" ];
        roots = [
          "Setup.hs"
          "stack.yaml"
          "*.cabal"
        ];
        comment-token = "--";
        indent = {
          tab-width = 2;
          unit = "  ";
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
        name = "julia";
        scope = "source.julia";
        injection-regex = "julia";
        file-types = [ "jl" ];
        roots = [ ];
        comment-token = "#";
        language-servers = [ "julia" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "php";
        scope = "source.php";
        injection-regex = "php";
        file-types = [
          "php"
          "inc"
        ];
        shebangs = [ "php" ];
        roots = [
          "composer.json"
          "index.php"
        ];
        language-servers = [ "intelephense" ];
        indent = {
          tab-width = 4;
          unit = "    ";
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
      {
        name = "ruby";
        scope = "source.ruby";
        injection-regex = "ruby";
        file-types = [
          "rb"
          "rake"
          "rakefile"
          "irb"
          "gemfile"
          "gemspec"
          "Rakefile"
          "Gemfile"
          "rabl"
          "jbuilder"
          "jb"
        ];
        shebangs = [ "ruby" ];
        roots = [ ];
        comment-token = "#";
        language-servers = [ "solargraph" ];
        auto-format = true;
        indent = {
          tab-width = 2;
          unit = "  ";
        };
        formatter = {
          command = "bundle";
          args = [
            "exec"
            "rubocop"
            "--stdin"
            "foo.rb"
            "--fix"
            "--stderr"
            "--fail-level"
            "fatal"
          ];
        };
      }
      {
        name = "javascript";
        scope = "source.js";
        injection-regex = "(js|javascript)";
        file-types = [
          "js"
          "mjs"
          "cjs"
        ];
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
        indent = {
          tab-width = 2;
          unit = "  ";
        };
        formatter = {
          command = "deno";
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
      {
        name = "c-sharp";
        scope = "source.csharp";
        injection-regex = "c-?sharp";
        file-types = [ "cs" ];
        roots = [
          "sln"
          "csproj"
        ];
        comment-token = "//";
        indent = {
          tab-width = 4;
          unit = "\t";
        };
      }
    ];
    language-server = {
      ols = {
        command = lib.getExe pkgs.ols;
        args = [ ];
      };
      jdtls = {
        command = lib.getExe pkgs.jdt-language-server;
      };
      gopls = {
        command = lib.getExe pkgs.gopls;
      };
      lua-language-server = {
        command = "lua-language-server";
        args = [ ];
      };
      fortls = {
        command = lib.getExe pkgs.fortls;
        args = [ "--lowercase_intrinsics" ];
      };
      yaml-language-server = {
        command = lib.getExe pkgs.yaml-language-server;
        args = [ "--stdio" ];
      };
      cmake-language-server = {
        command = lib.getExe pkgs.cmake-language-server;
      };
      julia = {
        command = "julia";
        args = [
          "--startup-file=no"
          "--history-file=no"
          "--quiet"
          "-e"
          "using LanguageServer; runserver()"
        ];
      };
      bash-language-server = {
        command = lib.getExe pkgs.bash-language-server;
        args = [ "start" ];
      };
      solargraph = {
        command = lib.getExe pkgs.solargraph;
        args = [ "stdio" ];
      };
      # intelephense = {
      #   command = lib.getExe pkgs.intelephense;
      #   args = [ "--stdio" ];
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
        args = [
          "--handler"
          "copilot"
          "--copilotApiKey"
          ""
        ];
      };
    };
    grammar = {
      grammar = [
        {
          name = "c-sharp";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-c-sharp";
            rev = "5b60f99545fea00a33bbfae5be956f684c4c69e2";
          };
        }
        {
          name = "go";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-go";
            rev = "0fa917a7022d1cd2e9b779a6a8fc5dc7fad69c75";
          };
        }
        {
          name = "tsx";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-typescript";
            rev = "3e897ea5925f037cfae2e551f8e6b12eec2a201a";
          };
        }
        {
          name = "typescript";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-typescript";
            rev = "3e897ea5925f037cfae2e551f8e6b12eec2a201a";
          };
        }
        {
          name = "javascript";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-javascript";
            rev = "4a95461c4761c624f2263725aca79eeaefd36cad";
          };
        }
        {
          name = "nix";
          source = {
            git = "https://github.com/cstrahan/tree-sitter-nix";
            rev = "6b71a810c0acd49b980c50fc79092561f7cee307";
          };
        }
        {
          name = "ruby";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-ruby";
            rev = "4c600a463d97e36a0ca5ac57e11f3ac8c297a0fa";
          };
        }
        {
          name = "bash";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-bash";
            rev = "275effdfc0edce774acf7d481f9ea195c6c403cd";
          };
        }
        {
          name = "php";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-php";
            rev = "57f855461aeeca73bd4218754fb26b5ac143f98f";
          };
        }
        {
          name = "julia";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-julia";
            rev = "fc60b7cce87da7a1b7f8cb0f9371c3dc8b684500";
          };
        }
        {
          name = "java";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-java";
            rev = "bd6186c24d5eb13b4623efac9d944dcc095c0dad";
          };
        }
        {
          name = "yaml";
          source = {
            git = "https://github.com/ikatyang/tree-sitter-yaml";
            rev = "0e36bed171768908f331ff7dff9d956bae016efb";
          };
        }
        {
          name = "haskell";
          source = {
            git = "https://github.com/tree-sitter/tree-sitter-haskell";
            rev = "b6ec26f181dd059eedd506fa5fbeae1b8e5556c8";
          };
        }
        {
          name = "fortran";
          source = {
            git = "https://github.com/stadelmanma/tree-sitter-fortran";
            rev = "f0f2f100952a353e64e26b0fa710b4c296d7af13";
          };
        }
        {
          name = "odin";
          source = {
            git = "https://github.com/MineBill/tree-sitter-odin";
            rev = "da885f4a387f169b9b69fe0968259ee257a8f69a";
          };
        }
        {
          name = "sql";
          source = {
            git = "https://github.com/DerekStride/tree-sitter-sql";
            rev = "0caa7fa2ee00e0b770493a79d4efacc1fc376cc5";
          };
        }
        {
          name = "make";
          source = {
            git = "https://github.com/alemuller/tree-sitter-make";
            rev = "a4b9187417d6be349ee5fd4b6e77b4172c6827dd";
          };
        }
        {
          name = "cmake";
          source = {
            git = "https://github.com/uyha/tree-sitter-cmake";
            rev = "f6616f1e417ee8b62daf251aa1daa5d73781c596";
          };
        }
        {
          name = "zig";
          source = {
            git = "https://github.com/maxxino/tree-sitter-zig";
            rev = "8d3224c3bd0890fe08358886ebf54fca2ed448a6";
          };
        }
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
