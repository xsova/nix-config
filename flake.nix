{
  description = "Nix flake for NixOS on a laptop, desktop, server, and Macbook (NixDarwin)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows  = "nixpkgs";
    };
    pinix.url = "github:remi-dupre/pinix"; # Tool to see nix rebuild progress similar to pacman in Arch linux.
    wezterm.url = "github:wez/wezterm?dir=nix"; # Tmuxer and terminal emulator.
    rust-overlay.url = "github:oxalica/rust-overlay";
    hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs: {
    darwinConfigurations = with inputs; {
      macbook = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          nix-index.darwinModules.nix-index
          home-manager.darwinModules.home-manager
          ./hosts/macbook/modules/default.nix
        ];
      };
    };
    # `with` is similar to `using namespace` in c++
    nixosConfigurations = with inputs; { 
      framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Allows modules to use inputs as args
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          nix-index.nixosModules.nix-index
          hardware.nixosModules.framework-13-7040-amd # Specifically utilizing module for AMD Framework Laptop 13
          ./hosts/framework/modules/default.nix
          ./hosts/framework/home/default.nix
        ];
      };
    };
  };
}
