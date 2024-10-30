{ pkgs, ... }:

{
  services = {
    nix-daemon.enable = true; # Must be ran for darwin-nix to work on macOS
    skhd.enable = true; # Simple Hotkey Daemon for macOS // makes api calls to wm
    yabai.enable = true; # Tiling window manager tool for macOS
  };
  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
