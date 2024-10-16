{ ... }:

{
  home-manager = {
    # useUserPackages = true;
    useGlobalPkgs = true;
    users.bryce = {
      imports = [
        ./home
        ./helix
        ./programs
        ./path
        ./env
        ./fish
        ./wezterm
        ./zellij
      ];
    };
  };
}
