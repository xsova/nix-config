{pkgs, ...}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
        "Iosevka"
      ];
    })
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    font-awesome_6
    fira-code
    fira-code-symbols
  ];
}
