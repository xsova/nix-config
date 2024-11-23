{
  pkgs,
  user,
  host,
  lib,
  inputs,
  ...
}: {
  home = import ../../modules/home/home.nix {inherit pkgs user;};
  programs = {
    fish = import ../../modules/home/fish.nix {inherit pkgs lib host;};
    alacritty = import ../../modules/home/alacritty.nix {inherit pkgs lib;};
    helix = import ../../modules/home/helix.nix {inherit pkgs lib;};
    starship = import ../../modules/home/starship.nix;
    direnv = import ../../modules/home/direnv.nix;
    waybar = import ../../modules/home/waybar.nix;
  };
  services = {
    easyeffects.enable = true;
    dunst.enable = true;
    wlsunset.enable = false; # = { enable = true; latitude = 41.28; longitude = 95.99; };
  };
  wayland.windowManager.hyprland = import ../../modules/home/hyprland.nix {inherit inputs pkgs;};
  xdg.userDirs = import ../../modules/home/xdg.nix;
}
