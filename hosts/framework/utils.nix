{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    tig
    vim
    neovim
    helix
    wget
    ollama
    git
    curl
    htop
    ripgrep
    fd
    bat
    eza
    fzf
    fish
    starship
    (inputs.pinix.packages.${pkgs.stdenv.hostPlatform.system}.pinix)
    gnused
    gzip
    gnugrep
    killall
    unzip
    tree
    lsd
    lsof
    autojump
    coreutils
  ];
  programs = {
    fish.enable = true;
    starship.enable = true;
  };
  services.ollama.enable = true;
}
