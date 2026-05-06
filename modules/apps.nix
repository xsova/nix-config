{ pkgs, ... }:
{
  environment = {
    shells = with pkgs; [
      bashInteractive
      fish
      zsh
    ];
    systemPackages = with pkgs; [
      (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)
      # apple-sdk
      # darwin.libiconv
      # bacon
      bat
      btop
      # cacert
      # caligula
      # cargo-audit
      # cargo-bloat
      # cargo-cross
      # cargo-deny
      # cargo-edit
      # cargo-license
      # cargo-modules
      # cargo-nextest
      # cargo-outdated
      # cargo-spellcheck
      # cargo-tarpaulin
      # cargo-unused-features
      # cargo-watch
      # cargo-zigbuild
      clang
      clang-tools
      cmake
      coreutils
      curl
      # dateutils
      delve
      # diffutils
      direnv
      emmet-language-server
      findutils
      fish-lsp
      fzf
      gawk
      gh
      git
      gnugrep
      gnumake
      gnupg
      gnused
      go
      gopls
      gzip
      jq
      killall
      lazygit
      lldb
      llvm
      lsd
      lsof
      lua
      luajitPackages.luacheck
      m-cli
      markdown-oxide
      # marksman
      neovim
      # nil
      nodejs
      nodemon
      typescript
      typescript-language-server
      vscode-langservers-extracted
      yaml-language-server
      openssh
      parallel
      pinentry_mac
      pylyzer
      pyright
      python312
      ripgrep
      # rustc
      shellcheck
      shfmt
      slint-lsp
      lua-language-server
      taplo
      tree
      unzip
      vim
      # w3m
      # watch
      weechat
      wget
      yubikey-agent
      zellij
      zig
      zls
      # SDL2.dev
    ];
    variables = {
      JDK_PATH = "${pkgs.jdk11}/";
      NODEJS_PATH = "${pkgs.nodejs}/";
    };
    # extraInit = ''
    #   # [[ -f /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh ]] && source /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh
    #   export alias sudo=/run/wrappers/bin/sudo
    # '';
  };
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    global.autoUpdate = true;
    brews = [
      {
        name = "ollama";
        start_service = true;
        restart_service = "changed";
      }
      "ykman"
      "qmk/qmk/qmk"
      "helix"
    ];
    casks = [
      # "balenaetche"
      # "alacritty"
      "github"
      "arc"
      "jetbrains-toolbox"
      "cursor"
      "parallels"
      "protonvpn"
      "launchcontrol"
      "betterdisplay"
      "hiddenbar"
      "discord"
      "spotify"
      "steam"
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/services"
      "FelixKratz/formulae"
      "osx-cross/avr"
      "osx-cross/arm"
      "qmk/qmk"
    ];
  };
  programs.fish.enable = true;
}
