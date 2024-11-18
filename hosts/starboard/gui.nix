{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    firefox
    gimp
    iwgtk 
    jetbrains.aqua
    kitty
    libreoffice
    mullvad-browser
    vscode
    wezterm
  ];
}
