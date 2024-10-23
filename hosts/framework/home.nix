
{ inputs, ... }:

{
  home-manager = {
    users.bryce.home.stateVersion = "24.05";
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    
    users.bryce = {
      imports = [
        # ../../home/hyprland.nix
        ../../home/waybar.nix
        ../../home/helix.nix
        # ../../home/programs.nix
        # ../../home/path.nix
        # ../../home/env.nix
        ../../home/fish.nix
        ../../home/wezterm.nix
        # ../../home/zellij.nix
        ../../home/hyprland.nix
        ../../home/hyprlock.nix
      ];
     
      xdg.userDirs = {
          enable = true;
          createDirectories = true;
          desktop = "$HOME/Desktop";
          documents = "$HOME/Documents";
          download = "$HOME/Downloads";
          extraConfig = {
            XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
          };
          music = "$HOME/Music";
          pictures = "$HOME/Pictures";
          videos = "$HOME/Videos";
        };
      };
    backupFileExtension = "bak";
  };
}
