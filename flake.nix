{
  description = "Nix flake for NixOS on a laptop, desktop, server, and Macbook (NixDarwin)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    agenix.url = "github:ryantm/agenix";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs:
    let
      user = "bryce";
      hostName1 = "framework";
      hostName2 = "srv";
      hostName3 = "desktop";
      hostName4 = "macbook";
    in with inputs;
    {
      nixosConfigurations = {
        ${hostName1} = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/framework/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/framework/default.nix;
              extraSpecialArgs = { inherit inputs; };
            }
          ];
        };

        ${hostName2} = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/server/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/server/default.nix;
              extraSpecialArgs = { inherit inputs; };
            }
          ];
        };

        ${hostName3} = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/desktop/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/desktop/default.nix;
              extraSpecialArgs = { inherit inputs; };
            }
          ];
        };
      };

      darwinConfigurations = {
        ${hostName4} = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/macbook
            index.darwinModules.nix-index
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/darwin;
              extraSpecialArgs = { inherit inputs; };
            }
          ];
        };
      };

      homeConfigurations = {
        "${user}@${hostName1}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit outputs; };
          modules = [
            ./home/framework/default.nix
          ];
        };
        "${user}@${hostName2}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit outputs; };
          modules = [
            ./home/server/default.nix
          ];
        };
        "${user}@${hostName3}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit outputs; };
          modules = [
            ./home/desktop/default.nix
          ];
        };
        "${user}@${hostName4}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          extraSpecialArgs = { inherit outputs; };
          modules = [
            ./home/darwin/default.nix
          ];
        };
      };
    };
}
