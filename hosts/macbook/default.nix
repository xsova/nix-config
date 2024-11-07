{ pkgs, lib, inputs, ... }:

{
  imports = [
    ../../modules/rust.nix
    ../../modules/homebrew.nix
    ../../modules/secrets.nix
    ../../modules/lsp.nix
    ../../modules/devtools.nix
    ../../modules/cli-tools.nix
    ../../modules/programming-languages.nix
    ../../modules/skhd.nix
    ../../modules/yabai.nix
    ../../modules/jankyborders.nix
    # ../../modules/spacebar.nix
    ../../modules/fish.nix
    ../../modules/sketchybar.nix
  ];
  security.pam.enableSudoTouchIdAuth = true;
  users.users.bryce = {
    name = "bryce";
    home = "/Users/bryce";
    shell = pkgs.fish;
  };
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Iosevka" ]; })
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome_6
      fira-code
      fira-code-symbols
      # custom-font.dank-mono  
  ];
  nix = {
    settings = {
      allowed-users = [ "root" "bryce" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      auto-optimise-store = true;
      cores = 6;
      max-jobs = 10;
      sandbox = false;
      nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
  };
  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  services.nix-daemon.enable = true;
  environment = {
    systemPackages = [
      pkgs.m-cli
      pkgs.pinentry_mac
      pkgs.cava
    ];
    etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
    extraInit = let
      homeManagerSessionVars = 
        "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh";
      in ''
        [[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars}
      '';
  };
  nixpkgs = {
    config.allowUnfree = true;
    flake = {
      setFlakeRegistry = true;
      setNixPath = true;
    };
    buildPlatform = "aarch64-darwin";
    hostPlatform = "aarch64-darwin";
  };
  system = {
    stateVersion = 5;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = false;
    };
    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = 4.0;
      spaces.spans-displays = false;
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        orientation = "bottom";
        dashboard-in-overlay = true;
        largesize = 85;
        tilesize = 50;
        magnification = false;
        launchanim = true;
        mru-spaces = false;
        show-recents = false;
        show-process-indicators = true;
        static-only = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf"; # Current folder
        QuitMenuItem = true;
      };
      NSGlobalDomain = {
        AppleFontSmoothing = 0;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3; #FIXME: what is this?
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 10;
        KeyRepeat = 2;
        NSAutomaticWindowAnimationsEnabled = true;
        NSWindowShouldDragOnGesture = true; # Can drag windows anywhere when holding cmd + ctrl
        NSWindowResizeTime = 0.1;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.trackpad.scaling" = 2.0;
        # NSAutomaticSpellingCorrectEnabled = false;
      };
    };
  };
  networking = {
    computerName = "Bryce's MacBook Pro";
    hostName = "macbook";
    knownNetworkServices = [ "Wi-Fi" ];
    dns = [ "9.9.9.9" "1.1.1.1" "8.8.8.8" ];
  };
}

