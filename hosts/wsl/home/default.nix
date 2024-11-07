{ ... }: 

let
  username = "";
in {
  home-manager = {
    useGlobalPkgs = true;

    users.bryce = {
      imports = [
        # ../../../home/alacritty.nix
        # ../../../home/fish.nix
        # ../../../home/helix.nix
        # ../../../home/environment.nix
        # ../../../home/starship.nix
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
