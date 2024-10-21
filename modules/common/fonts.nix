{ pkgs, ... }:

{
  fonts = {
    fontconfig.defaultFonts.monospace = [ "Hack Nerd Font Mono" ];
    fontDir.enable = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      fira-code-nerdfont
      hack-font
      material-design-icons
      material-symbols
      meslo-lgs-nf
      nerdfonts
      jebrains-mono
      ( nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];
  };
}
