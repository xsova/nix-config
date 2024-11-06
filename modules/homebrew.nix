{ ... }:

{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    global.autoUpdate = true;
    brews = [
      "ollama"
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
      "fleet"
      "sf-symbols"
      "font-jetbrains-mono-nerd-font"
      "font-jetbrains-mono"
      "background-music"
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
