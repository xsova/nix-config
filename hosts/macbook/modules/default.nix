{ ... }:

{
  imports = [
    ./homebrew
  ];
  system.stateVersion = 5;
  services.nix-daemon.enable = true;
}

