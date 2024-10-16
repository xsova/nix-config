{ ... }:

{
  imports = [
    ./homebrew
    ./lsp
    ./devtools
    ./nix-settings
    ./cli-tools
  ];
  system.stateVersion = 5;
  services.nix-daemon.enable = true;
}

