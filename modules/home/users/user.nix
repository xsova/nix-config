{
  pkgs,
  user,
  host,
  lib,
  inputs,
  ...
}:
{
  home = import ../../../modules/home/home.nix { inherit pkgs user; };
  textfox = {
    enable = true;
    profile = "Profile";
    config = {
      background.color = "#24273a";
      border = {
        color = "#a5adcb";
        width = "4px";
        transition = "1.0s ease";
        radius = "3px";
      };
      displayHorizontalTabs = true;
      displayNavButtons = true;
      newtabLogo = "   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";
    };
    # font = {
    #   family = "MD IO Trial";
    #   size = "14px";
    #   accent = "#a5adcb";
    # };
    # sidebery.margin = "1.0rem";
  };
  programs = {
    fish = import ../../../modules/home/fish.nix { inherit host; };
    alacritty = import ../../../modules/home/alacritty.nix { inherit host pkgs lib; };
    helix = import ../../../modules/home/helix.nix { inherit pkgs lib; };
    starship = import ../../../modules/home/starship.nix;
    direnv = import ../../../modules/home/direnv.nix;
    waybar = import ../../../modules/home/waybar.nix;
  };
  services = {
    easyeffects.enable = true;
    dunst.enable = true;
    wlsunset = {
      enable = true;
      sunrise = "07:30";
      sunset = "17:00";
    };
  };
  wayland.windowManager.hyprland = import ../../../modules/home/hyprland.nix { inherit inputs pkgs; };
  xdg.userDirs = import ../../../modules/home/xdg.nix;
  imports = [ inputs.textfox.homeManagerModules.default ];
}
