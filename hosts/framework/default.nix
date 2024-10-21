{ ... }:

{
  imports = [
    ../../home/hyprland.nix
    ./boot.nix
    ./configuration.nix
    ./desktop.nix
    ./devtools.nix
    ./environment-variables.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./home.nix
    ./hyprland.nix
    ./locale.nix
    ./lsp.nix
    ./networking.nix
    # ./mesa.nix # Sets up mesa to match hyprland, workaround for an issue.
    ./programming-languages.nix
    ./services.nix
    ./ssh.nix
    ./utils.nix
  ];
}
