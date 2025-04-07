{ inputs, self, ... }: inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { inherit inputs; };
  modules = let
      user = "bryce";
      host = "port";
      platform = "aarch64-darwin";
    in [({ inputs, pkgs, lib, config, ... }: {
          environment = import ../../modules/common/environment.nix { inherit host pkgs inputs; };
          fonts = import ../../modules/common/fonts.nix { inherit pkgs; };
          programs.fish.enable = true;
          home-manager = {
            backupFileExtension = "home.bak";
            useGlobalPkgs = true;
            users = {
              ${user} = {
                home = import ../../modules/home/home.nix { inherit pkgs user; };
                programs = {
                  fish = import ../../modules/home/fish.nix { inherit pkgs host; };
                  alacritty = import ../../modules/home/alacritty.nix { inherit pkgs lib; };
                  helix = import ../../modules/home/helix.nix { inherit pkgs lib; };
                  direnv = import ../../modules/home/direnv.nix;
                  git = import ../../modules/home/git.nix { inherit user; };
                  gh = import ../../modules/home/gh.nix;
                  gitui = import ../../modules/home/gitui.nix;
                };
              };
            };
          };
          homebrew = import ../../modules/darwin/homebrew.nix;
          launchd.user.agents = import ../../modules/darwin/launchd.nix { inherit lib pkgs; };
          networking = import ../../modules/darwin/networking.nix { inherit host; };
          nix = import ../../modules/common/nix-settings.nix { inherit inputs; };
          nixpkgs = import ../../modules/common/nixpkgs.nix { inherit platform self; };
          security.pam.services.sudo_local.touchIdAuth = true;
          services = {
            jankyborders = import ../../modules/darwin/jankyborders.nix;
            sketchybar = import ../../modules/darwin/sketchybar.nix;
            yabai = import ../../modules/darwin/yabai.nix;
            skhd = import ../../modules/darwin/skhd.nix { inherit pkgs; };
            spacebar = import ../../modules/darwin/spacebar.nix { inherit pkgs; };
          };
          system = import ../../modules/darwin/system-configuration.nix { inherit config pkgs self; };
          users.users.bryce = import ../../modules/darwin/users/user.nix { inherit user pkgs; };
        }
      )
    ]
    ++ [
      inputs.nix-index.darwinModules.nix-index
      inputs.home-manager.darwinModules.default
    ];
}
