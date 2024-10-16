{ ... }:

{
  imports = [
    ./homebrew
    ./lsp
    ./devtools
    ./nix-settings
    ./cli-tools
    ./programming-languages
    ./rust
    ./services/default.nix
  ];
  system.stateVersion = 5;
}

