{ ... }: 

let
  username = "bryce";
in {
  home-manager = {
    useGlobalPkgs = true;

    users.bryce = {
      imports = [
        ../../../home/alacritty.nix   # Configurations for Alacritty (terminal emulator)
        ../../../home/fish.nix        # Configurations for fish shell
        ../../../home/helix.nix       # Configurations for Helix text editor
        ../../../home/environment.nix # Environment variables
        ../../../home/starship.nix    # Starship prompt for shell
      ];
      home = {
        username = "bryce";
        homeDirectory = "/Users/bryce";
        stateVersion = "24.05";
        sessionPath = [
          "/home/${username}/.nix-profile/bin"
          "/home/${username}/.local/bin"
          "/home/${username}/go/bin"
          "/run/current-system/sw/bin"
          "/nix/var/nix/profiles/default/bin"
          "/usr/bin"
          "/bin"
          "/usr/local/bin"
          "/usr/sbin"
          "/sbin"
        ];
      };
    };
  };
}
