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
    exa
    fzf
    fish
    starship
  ];

  programs = {
    fish.enable = true;
    starship.enable = true;
  };
}
