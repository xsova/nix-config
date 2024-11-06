{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.clion
    jetbrains.aqua # Jetbrains IDE for automated tests
    cmake
    gnumake # FOSS make
    wezterm # Terminal emulator
    zellij # Terminal multiplexer
    alacritty
  ];
}
