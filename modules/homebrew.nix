{ ... }:

{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    global.autoUpdate = true;
    brews = [
      "ollama"
      # "borders"
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
      "yubico-authenticator"
      "zen-browser"
      "sizzy"
      "protonvpn"
      "launchcontrol"
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
