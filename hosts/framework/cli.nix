{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    at-spi2-atk
    autojump
    bat
    cmake
    coreutils
    curl
    eza
    fd
    ffmpeg_6-full
    fish
    fzf
    gifsicle
    git
    gnugrep
    gnumake
    gnused
    gzip
    helix
    htop
    imagemagick
    impala
    (inputs.pinix.packages.${pkgs.stdenv.hostPlatform.system}.pinix)
    killall
    lsd
    lsof
    neovim
    ollama
    playerctl
    psi-notify
    psmisc
    ripgrep
    starship
    tig
    tree
    unzip
    vim
    wget
    xdg-utils
    zellij
  ];

  programs = {
    fish.enable = true;
    starship.enable = true;
  };
}
