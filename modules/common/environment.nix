{ pkgs, inputs, headless ? false, host, ... }: let
  packages = {
    gui = with pkgs; if pkgs.stdenv.isDarwin then [ ] else [ iwgtk code-cursor mullvad-browser ] ++ (if !headless then [ jetbrains.aqua ] else [ ]);
    cli =
      with pkgs;
      [
        nushell yazi SDL2.dev clamav clang clang-tools coreutils curl dateutils
        diffutils findutils gawk gnugrep gnumake gnused gtest gzip killall lldb
        llvm lsd lsof parallel tree unzip vim watch ripgrep fzf jq gnupg yubikey-agent
        cacert wget zellij shfmt direnv openssh

        # Git
        git lazygit gh

        # Text edit/view
        bat vim neovim

        # Zig
        zig zls

        # Fish
        fish-lsp

        # Rust
        (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml) rustc taplo
        cargo-watch cargo-deny cargo-audit cargo-edit cargo-outdated cargo-license
        cargo-tarpaulin cargo-cross cargo-zigbuild cargo-nextest cargo-spellcheck
        cargo-modules cargo-bloat cargo-unused-features bacon evcxr slint-lsp

        # Lua
        lua lua-language-server luajitPackages.luacheck sumneko-lua-language-server

        # Python
        python312Full pyright pylyzer

        # Node / TypeScript / JavaScript
        nodePackages_latest.nodejs nodePackages_latest.nodemon nodePackages_latest.typescript
        nodePackages_latest.typescript-language-server nodePackages_latest.vscode-langservers-extracted
        nodePackages_latest.yaml-language-server nodePackages_latest.bash-language-server

        # bash / sh
        shellcheck

        # Markdown
        marksman markdown-oxide

        # Nix
        nil

        # Go
        gopls delve go

        # Webdev
        emmet-language-server

        # C / C++
        cmake-language-server cmake gnumake

        # AI stuff
        helix-gpt
      ]
      ++ ( if pkgs.stdenv.isDarwin then [ m-cli apple-sdk pinentry_mac ] else [ helix linux-firmware nom impala playerctl pinentry ] );
    tui = with pkgs; [ lazygit caligula weechat discordo w3m btop ]
      ++ ( if pkgs.stdenv.isDarwin then [ ] else [ impala greetd.tuigreet pamixer ] );
  };
  nixos-hosts = with pkgs; ( if host == "core" then [ qmk-udev-rules linuxKernel.packages.linux_zen.framework-laptop-kmod alsa-lib alsa-utils ] else [ ] );
in {
  shells = with pkgs; [ nushell fish bashInteractive zsh ];
  systemPackages = packages.cli ++ packages.gui ++ packages.tui ++ (if pkgs.stdenv.isLinux then nixos-hosts else [ ]);
  variables = {
    JDK_PATH = "${pkgs.jdk11}/";
    NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
  };
  etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  extraInit =
    let homeManagerSessionVars = "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"; in
    ''
      [[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars}
      export alias sudo=/run/wrappers/bin/sudo
    '';
}
