{...}: {
  home-manager = {
    useGlobalPkgs = true;

    users.bryce = {
      imports = [
        ../../../modules/home/alacritty.nix
        ../../../modules/home/fish.nix
        ../../../modules/home/helix.nix
        ../../../modules/home/environment.nix
        ../../../modules/home/starship.nix
        ../../../modules/home/direnv.nix
      ];
      home = {
        username = "bryce";
        homeDirectory = "/Users/bryce";
        stateVersion = "24.05";
        sessionPath = [
          "/Users/bryce/.nix-profile/bin"
          "/Users/bryce/.local/bin"
          "/Users/bryce/go/bin"
          "/run/current-system/sw/bin"
          "/opt/homebrew/bin"
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
