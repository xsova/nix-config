{ ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    users.bryce = {
      imports = [
        ./home.nix
        ./helix.nix
        ./programs.nix
        ./path.nix
        ./env.nix
        ./fish.nix
        ./wezterm.nix
        ./zellij.nix
      ];
    };
  };
}
