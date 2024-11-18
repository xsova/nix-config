{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    htop
    ripgrep
    fd
    bat
    fzf
    fish
    starship
  ];
}
