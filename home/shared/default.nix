{ ... }:

{
  imports = [
    ./helix
    ./fish
    ./wezterm
    ./zellij
  ];

  programs = {
    fish.enable = true;
    ripgrep.enable = true;
    bat.enable = true;
    htop.enable = true;
  };

  catppuccin = {
    enable = true;
    flavor = true;
  };
}
