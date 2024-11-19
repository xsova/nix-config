{
  inputs,
  self,
  ...
}:
inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = {inherit inputs;};
  modules = let
    user = "bryce";
    host = "shell";
    darwin = true;
  in [
    inputs.nix-index.darwinModules.nix-index
    inputs.home-manager.darwinModules.default
    inputs.lix.nixosModules.default
    ({
      inputs,
      pkgs,
      lib,
      config,
      ...
    }: {
      environment = import ../../modules/common/environment.nix {inherit darwin pkgs inputs;};
      fonts       = import ../../modules/common/fonts.nix {inherit pkgs;};
      programs.fish.enable = true;
      home-manager = {
        useGlobalPkgs = true;
        users = {
          ${user} = {
            home = import ../../modules/home/home.nix {inherit pkgs user darwin;};
            programs = {
              fish      = import ../../modules/home/fish.nix {inherit lib darwin host;};
              alacritty = import ../../modules/home/alacritty.nix {inherit pkgs lib;};
              helix     = import ../../modules/home/helix.nix {inherit pkgs lib;};
              starship  = import ../../modules/home/starship.nix;
              direnv    = import ../../modules/home/direnv.nix;
            };
          };
        };
      };
      homebrew = import ../../modules/darwin/homebrew.nix;
      launchd.user.agents = {
        yabai.serviceConfig.EnvironmentVariables.SHELL    = lib.getExe pkgs.zsh;
        skhd.serviceConfig.EnvironmentVariables.SHELL     = lib.getExe pkgs.dash;
        spacebar.serviceConfig.EnvironmentVariables.SHELL = lib.getExe pkgs.dash;
      };
      networking = {
        computerName         = "Bryce's MacBook Pro";
        hostName             = host;
        knownNetworkServices = ["Wi-Fi"];
      };
      nix = import ../../modules/common/nix-settings.nix {inherit inputs;};
      nixpkgs = {
        config.allowUnfree = true;
        hostPlatform       = "aarch64-darwin";
        buildPlatform      = "aarch64-darwin";
        flake = {
          setNixPath       = true;
          setFlakeRegistry = true;
        };
        overlays = [
          inputs.rust-overlay.overlays.default
        ];
      };
      security.pam.enableSudoTouchIdAuth = true;
      services = {
        nix-daemon.enable = true;
        jankyborders      = import ../../modules/darwin/jankyborders.nix;
        sketchybar        = import ../../modules/darwin/sketchybar.nix;
        skhd              = import ../../modules/darwin/skhd.nix {inherit lib pkgs;};
        yabai             = import ../../modules/darwin/yabai.nix;
      };
      system = import ../../modules/darwin/system-configuration.nix {inherit config pkgs self;};
      users.users.bryce = {
        name  = user;
        home  = "/Users/${user}";
        shell = pkgs.fish;
      };
    })
  ];
}
