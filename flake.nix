{
  description = "Nix flake for NixOS on a laptop, desktop, server, and Macbook (NixDarwin)";

  inputs = {
    # Specify the nixpkgs repository to use.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # Include Home Manager and make it follow (mirro) the version nixpkgs uses.
    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Include Nix Darwin and make it follow nixpkgs.
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Tool to quickly locate the package providing a certain file in nixpkgs.
    nix-index = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows  = "nixpkgs";
    };

    # Source urls for things not in nixpkgs / that I want a different or more up-to-date version of.
    pinix.url = "github:remi-dupre/pinix"; # Tool to see nix rebuild progress similar to pacman in Arch linux.
    wezterm.url = "github:wez/wezterm?dir=nix"; # Tmuxer and terminal emulator.
    rust-overlay.url = "github:oxalica/rust-overlay";

    # Firmware/tools that are device specific for nixOS.
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
          ./hosts/macbook/modules/default.nix
          ./hosts/macbook/home/default.nix
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
