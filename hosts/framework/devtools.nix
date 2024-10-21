{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.aqua
    cmake
    gnumake
    zellij
  ];
}
