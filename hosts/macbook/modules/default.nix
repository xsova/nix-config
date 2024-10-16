{ ... }:

{
  imports = [
    ./homebrew
    ./lsp
    ./devtools
    ./nix-settings
  ];
  system.stateVersion = 5;
  services.nix-daemon.enable = true;
}

