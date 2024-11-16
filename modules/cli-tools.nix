{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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

    # Search
    fd            # A better `find`.
    tealdeer      # Faster `tldr`.
    autojump      # Faster `cd`
    ripgrep       # Faster grep.
    fzf           # Directory fuzzy finder

    # Text Processors
    jq            # Query JSON.
    fx            # Interactively navigate through JSON.
    yq-go         # Query YAML.
    bat           # Preview with code highlight.
    vim           # Basic editor

    # System
    home-manager  # Nix tool to manage configs.

    # Shells
    nushell

    # Security
    gnupg         # To manage GNUPG keys.
    # pinentry      # To input keys.
    cacert        # Certificate authority tools
    yubikey-agent # Hardware security token agent.
 
    # Web
    wget          # Download stuff.

    # Dev
    shellcheck    # Linter for shell scripts.
    shfmt         # Format shell scripts
    direnv        # Environment per directory.
    git           # Version control
    lazygit       # Nice diff viewer
    gh            # Github abstractions
    openssh       # Secure SHell

    # Monitoring
    procs         # Fancy `ps`.
    htop          # Fancy `top`.
    alejandra
    (inputs.pinix.packages.${
      pkgs.stdenv.hostPlatform.system
    }.pinix)      # Nix progress viewer.
  ];
}
