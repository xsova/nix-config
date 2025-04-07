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
    "qmk/qmk/qmk"
    "helix"
  ];
  casks =
    let
      browsers = [
        "sizzy"
        "google-chrome"
        "arc"
      ];
      IDEs = [
        "jetbrains-toolbox"
        "visual-studio-code"
        "cursor"
      ];
      utilities = [
        "parallels"
        "docker"
        "balenaetcher"
        "yubico-authenticator"
        "protonvpn"
        "launchcontrol"
        "betterdisplay"
        "hiddenbar"
      ];
      apps = [
        "alacritty"
        "ghostty"
        "discord"
        "spotify"
        "steam"
      ];
      work = [
        "microsoft-teams"
        "microsoft-outlook"
      ];
    in
    browsers ++ IDEs ++ utilities ++ apps ++ work;
  taps = [
    "homebrew/bundle"
    "homebrew/services"
    "FelixKratz/formulae"
    "osx-cross/avr"
    "osx-cross/arm"
    "qmk/qmk"
  ];
}
