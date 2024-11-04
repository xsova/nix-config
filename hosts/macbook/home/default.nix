{ pkgs, ... }:

{
  programs = {
    # ripgrep.enable = true;
    # htop.enable = true;
    # ssh = {
    #   enable = true;
    #   package = pkgs.openssh;
    # };
  };
  home-manager = {
    useGlobalPkgs = true;

    users.bryce = {
      imports = [
        ../../../home/alacritty.nix
        ../../../home/fish.nix
        ../../../home/helix.nix
        ../../../home/environment.nix
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
