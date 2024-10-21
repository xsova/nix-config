{ pkgs, inputs, ... }:

let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.x86_64-linux;
in {
  hardware.opengl = {
    package = pkgs-unstable.mesa.drivers;
    driSupport32Bit = true;
    package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;
  };
}
