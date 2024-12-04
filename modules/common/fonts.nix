{pkgs, ...}: {
  packages = with pkgs; [
    # (nerdfonts.override {
    #   fonts = [
    #     "FiraCode"
    #     "JetBrainsMono"
    #     "Iosevka"
    #   ];
    # })
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    font-awesome_6
    fira-code
    fira-code-symbols
  ];
}
