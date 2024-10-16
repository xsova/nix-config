{ home-manager, ... }:

{
home-manager.users.bryce = {  home.stateVersion = "24.05";
  imports = [
    ./helix
    ./fish
    ./wezterm
    ./zellij
  ];

  programs = {
    fish.enable = true;
    ripgrep.enable = true;
    htop.enable = true;
  };
};
}
