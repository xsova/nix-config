{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cacert
    gnupg
    direnv
    openssh
    autojump
    bat
    coreutils
    curl
    diffutils
    gawk
    git
    gnugrep
    gnumake
    gnused
    gzip
    jq
    killall
    lazygit
    lsd
    lsof
    ripgrep
    tree
    unzip
    wget
    home-manager
    m-cli
    gh
    yubikey-agent
  ];
}
