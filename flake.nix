{
  description = "Nix flake for NixOS on a laptop, desktop, server, and Macbook (NixDarwin)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    catppuccin.url = "github:catppuccin/nix";
    nur.url = "github:nix-community/nur";
    rust.url = "github:oxalica/rust-overlay";
    zig.url = "github:mitchellh/zig-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      home-manager,
      catppuccin,
      ...
    }:
    let
      username = "bryce";
      email = "bryce@bryces.email";
      platform = "aarch64-darwin";
      hostname = "port";
      specialArgs = {
        inputs = inputs;
        self = self;
        inherit username email hostname platform catppuccin;
      };
    in
    {
      overlays = [
        inputs.nur.overlays.default
        inputs.rust.overlays.default
        inputs.zig.overlays.default
      ];
      darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
        inherit specialArgs;
        modules = [
          ./modules/nix.nix
          ./modules/system.nix
          ./modules/apps.nix
          ./modules/fonts.nix
          ./modules/launchd.nix
          ./modules/security.nix
          ./modules/services.nix
          ./modules/users.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              backupFileExtension = ".bak";
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              users.${username} = {
                imports = [
                  ./home
                  catppuccin.homeModules.catppuccin
                ];
              };
            };
          }
          inputs.nix-index.darwinModules.nix-index
          inputs.home-manager.darwinModules.default
        ];
      };
      formatter.${platform} = inputs.nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
    };
}
