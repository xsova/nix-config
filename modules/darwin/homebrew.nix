{
  enable = true;
  onActivation.cleanup = "zap";
  global.autoUpdate = true;
  brews = [
    {
      name = "ollama";
      start_service = true;
      restart_service = "changed";
    }
    # "borders"
    "qmk/qmk/qmk"
  ];
  casks = [
    "clion"
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
    "betterdisplay"
  ];
  taps = [
    "homebrew/bundle"
    "homebrew/services"
    "FelixKratz/formulae"
    "osx-cross/avr"
    "osx-cross/arm"
    "qmk/qmk"
  ];
}
