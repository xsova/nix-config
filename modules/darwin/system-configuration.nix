{
  config,
  pkgs,
  self,
  ...
}:
{
  build.applications = pkgs.lib.mkForce (
    pkgs.buildEnv {
      name = "applications";
      paths = config.environment.systemPackages ++ config.home-manager.users.bryce.home.packages;
      pathsToLink = "/Applications";
    }
  );
  configurationRevision = self.rev or self.dirtyRev or null;
  defaults = {
    ".GlobalPreferences"."com.apple.mouse.scaling" = 4.0;
    NSGlobalDomain = {
      "com.apple.trackpad.scaling" = 2.0;
      AppleFontSmoothing = 0;
      AppleInterfaceStyle = "Dark";
      AppleKeyboardUIMode = 3;
      AppleScrollerPagingBehavior = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      InitialKeyRepeat = 10;
      KeyRepeat = 2;
      NSAutomaticWindowAnimationsEnabled = true;
      NSWindowResizeTime = 0.1;
      NSWindowShouldDragOnGesture = true;
      "com.apple.sound.beep.feedback" = 0;
    };
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      dashboard-in-overlay = true;
      largesize = 85;
      launchanim = true;
      magnification = false;
      mru-spaces = false;
      orientation = "bottom";
      show-process-indicators = true;
      show-recents = false;
      static-only = false;
      tilesize = 50;
      # Hot corners
      wvous-tl-corner = 10; # Top left: Put display to sleep.
      wvous-tr-corner = 1; # Top right: Disabled.
      wvous-bl-corner = 13; # Bottom left: Lock screen.
      wvous-br-corner = 1; # Bottom right: Disabled.
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf"; # Search current directory first
      FXEnableExtensionChangeWarning = false; # Disable warning when changing file extension
      QuitMenuItem = true;
    };
    spaces.spans-displays = false;
  };
  keyboard = {
    remapCapsLockToControl = false;
    enableKeyMapping = true;
  };
  stateVersion = 5;
}
