{ inputs, ... }:

{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ../shared
    ./skhd/default.nix
    ./yabai/default.nix
  ];
  system.stateVersion = 5;
}
