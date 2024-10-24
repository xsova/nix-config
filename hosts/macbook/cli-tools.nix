{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    lsd
    lsof
    ripgrep
    tree
    unzip
    wget
    home-manager
    m-cli
    gh
  ];
}
