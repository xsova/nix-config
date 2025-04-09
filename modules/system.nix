{
  config,
  username,
  hostname,
  pkgs,
  self,
  ...
}:
{
  system = {
    stateVersion = 5;
    build.applications = pkgs.lib.mkForce (
      pkgs.buildEnv {
        name = "applications";
        paths = config.environment.systemPackages ++ config.home-manager.users.${username}.home.packages;
      }
    );
    configurationRevision = self.rev or self.dirtyRev or null;
    # activationScripts are executed every time you boot the system or run darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we don't need to logout and login again to make changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
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
        # Hot corners (all disabled)
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
      };
      finder = {
        AppleShowAllExtensions = true; # Show all file extensions
        AppleShowAllFiles = true; # Show hidden files (things prepended with `.`)
        CreateDesktop = false; # Whether to show icons on the desktop or not
        FXDefaultSearchScope = "SCcf"; # Search current directory first
        FXEnableExtensionChangeWarning = false; # Disable warning when changing file extension
        FXPreferredViewStyle = "Nlsv"; # Which finder view to use, "icnv" = Icon view, "Nlsv" = List view, "clmv" = Column View, "Flwv" = Gallery View.
        FXRemoveOldTrashItems = false; # Whether to remove trash items after 30 days.
        NewWindowTarget = "Home"; # Which folder to show when opening finder
        NewWindowTargetPath = null; # Sets the URI to open when NewWindowTarget is "Other"
        QuitMenuItem = true; # Allow quitting of the Finder application (cmd + q)
        ShowExternalHardDrivesOnDesktop = false; # Show external disks on desktop
        ShowHardDrivesOnDesktop = false; # Show hard disks on desktop
        ShowMountedServersOnDesktop = false; # Show connected servers on desktop
        ShowPathbar = true; # Show path breadcrumbs
        ShowRemovableMediaOnDesktop = false; # Show removable media (CDs, DVDs, and iPods) on desktop
        ShowStatusBar = true; # Show status bar at bottom of finder windows with item/disk space stats
        _FXShowPosixPathInTitle = true; # Show full path in finder title
        _FXSortFoldersFirst = true; # Keeps folders on top when sorting by name
        _FXSortFoldersFirstOnDesktop = false; # Keep folders on top when sorting by name on desktop
      };
      hitoolbox.AppleFnUsageType = "Show Emoji & Symbols"; # Chooses what happens when you press the fn key on the keyboard
      # loginWindow = {
      #   DisableConsoleAccess = false; # Disables the ability for a user to access the console by typing ">console" for a username in login window
      #   GuestEnabled = true; # Allows users to login to the machine as guest using the Guest account.
      #   LoginWindowText = null; # Text to be shown on the login window. Default is "\\U03bb"
      #   PowerOffDisabledWhileLoggedIn = false; # Power off disabled if true while user logged in.
      #   RestartDisabled = false; # Restart disabled if true while user logged in.
      #   SHOWFULLNAME = false; # Displays login window as a name and password field instead of a list of users
      #   ShutDownDisabled = false; # Hide the shutdown button on the login screen
      #   ShutDownDisabledWhileLoggedIn = false; # Hide shutdown button when user is logged in
      #   SleepDisabled = false; # Hide sleep button on login screen
      #   autoLoginUser = "Off"; # Auto login the supplied user on boot
      # };
      spaces.spans-displays = true; # Displays have separate Spaces. false = each physical display has a separate space, true = one space spans across all physical displays
    };
  };
  networking = {
    computerName = "Bryce's Macbook Pro";
    hostName = hostname;
    knownNetworkServices = [ "Wi-Fi" ];
  };
}
