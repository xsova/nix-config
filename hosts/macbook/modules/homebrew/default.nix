{ ... }:

{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    global.autoUpdate = true;
    brews = [
      "borders"
      "qmk/qmk/qmk"
    ];
    casks = [
      "docker"
      "microsoft-teams"
      "microsoft-outlook"
      "discord"
      "spotify"
      "arc"
      "visual-studio-code"
      "balenaetcher"
      "steam"
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/services"
      "FelixKratz/formulae"
      "osx-cross/avr"
      "osx-cross/arm"
      "qmk/qmk"
    ];
  };
}
