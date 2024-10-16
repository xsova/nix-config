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
  ];
  system.stateVersion = 5;
  services.nix-daemon.enable = true;
}

