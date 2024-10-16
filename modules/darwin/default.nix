{ pkgs, user, ... }:

{
  imports = [ 
    ../common/users
    ./homebrew
    ./system
    ./skhd
    ./programming-languages
    ./lsp
    ./fonts
    ./gc
    ./nix-settings
    ./services
    ./rust
    ./vpn
    ./packages
  ];


  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.nixFlakes;
}

