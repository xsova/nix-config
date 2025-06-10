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
    primaryUser = "bryce";
    stateVersion = 5;
    build.applications = pkgs.lib.mkForce (
      pkgs.buildEnv {
        name = "applications";
        paths = config.environment.systemPackages ++ config.home-manager.users.${username}.home.packages;
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
      spaces.spans-displays = false; # Displays have separate Spaces. false = each physical display has a separate space, true = one space spans across all physical displays
    };
  };
  networking = {
    computerName = "Bryce's Macbook Pro";
    hostName = hostname;
    knownNetworkServices = [ "Wi-Fi" ];
  };
}
