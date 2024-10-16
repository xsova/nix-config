{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    autojump
    coreutils
    curl
    wget
    diffutils
    git
    gawk
    gzip
    gnugrep
    gnumake
    gnused
    jq
    killall
    lsd
    lsof
    unzip
  ];
}
