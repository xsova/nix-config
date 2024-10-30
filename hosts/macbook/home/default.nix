{ ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    users.bryce = {
      imports = [
        ./alacritty.nix
        ./env.nix
        ./fish.nix
        ./helix.nix
        ./home.nix
        ./path.nix
        ./programs.nix
        ./wezterm.nix
        ./zellij.nix
      ];
    };
  };
}
