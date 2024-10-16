{ ... }:

{
  imports = [
    ./homebrew
    ./lsp
    ./devtools
    ./nix-settings
    ./cli-tools
    ./programming-languages
  ];
  system.stateVersion = 5;
  services.nix-daemon.enable = true;
}

