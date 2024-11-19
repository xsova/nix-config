{
  pkgs,
  inputs,
  darwin ? false,
  ...
}: {
  shells = with pkgs; [nushell fish bashInteractive zsh];
  systemPackages = with pkgs;
    (
      if darwin
      then [
        m-cli
        pinentry_mac
      ]
      else [
        # nixos-rebuild monitoring / progress tools
        (inputs.pinix.packages.${pkgs.stdenv.hostPlatform.system}.pinix)
        nom
      ]
    )
    ++ [
      # Consistent UNIX command line tools regardless of the OS
      curl
      coreutils
      diffutils
      findutils
      killall
      lsd
      lsof
      gawk
      gzip
      gnugrep
      watch
      tree
      parallel
      gnused
      dateutils
      unzip
      gnumake

      # Nix
      comma
      nix-index
      cachix

      # Search
      fd # A better `find`.
      tealdeer # Faster `tldr`.
      autojump # Faster `cd`
      ripgrep # Faster grep.
      fzf # Directory fuzzy finder

      # Text Processors
      jq # Query JSON.
      fx # Interactively navigate through JSON.
      yq-go # Query YAML.
      bat # Preview with code highlight.
      vim # Basic editor

      # System
      home-manager # Nix tool to manage configs.

      # Security
      gnupg # To manage GNUPG keys.

      # pinentry      # To input keys.
      cacert # Certificate authority tools
      yubikey-agent # Hardware security token agent.

      # Web
      wget # Download stuff.

      # Dev
      jetbrains.clion # C/++ IDE.
      jetbrains.aqua # QA automation IDE.
      cmake # C compiler & tools.
      gnumake # FOSS cmake.
      zellij # Terminal multiplexer.
      alacritty # Terminal emulator.
      shellcheck # Linter for shell scripts.
      shfmt # Format shell scripts
      direnv # Environment per directory.
      git # Version control
      lazygit # Nice diff viewer
      gh # Github abstractions
      openssh # Secure SHell

      # Programming languages
      go
      nodePackages_latest.nodejs
      nodePackages_latest.pnpm
      bun
      lua
      (python312Full.withPackages (ps: with ps; [pygobject3 gobject-introspection pyqt6-sip]))
      zig
      (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)

      # Rust stuff
      taplo
      cargo-watch
      cargo-deny
      cargo-audit
      cargo-edit
      cargo-outdated
      cargo-license
      cargo-tarpaulin
      cargo-cross
      cargo-zigbuild
      cargo-nextest
      cargo-spellcheck
      cargo-modules
      cargo-bloat
      cargo-unused-features
      bacon
      evcxr # Rust repl

      # LSPs
      python311Packages.python-lsp-server
      nodePackages_latest.nodemon
      nodePackages_latest.typescript
      nodePackages_latest.typescript-language-server
      nodePackages_latest.vscode-langservers-extracted
      nodePackages_latest.yaml-language-server
      nodePackages_latest.dockerfile-language-server-nodejs
      nodePackages_latest.bash-language-server
      nodePackages_latest.graphql-language-service-cli
      vue-language-server
      sumneko-lua-language-server
      marksman
      markdown-oxide
      nil
      gopls
      delve
      emmet-language-server
      buf
      cmake-language-server
      vscode-extensions.vadimcn.vscode-lldb
      slint-lsp
      terraform-ls
      ansible-language-server
      helix-gpt

      # Monitoring
      procs # Fancy `ps`.
      htop # Fancy `top`.
      btop # Fancy `htop`.
      alejandra # accessible via `nix fmt`
    ];

  etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  extraInit = let
    homeManagerSessionVars = "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh";
  in ''[[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars} '';
}
