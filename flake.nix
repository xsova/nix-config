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
  };

  outputs = inputs: {
    # `with` is similar to `using namespace` in c++
    nixosConfigurations = with inputs; { 
      framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Allows modules to use inputs as args
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          ./hosts/framework/modules/default.nix
          ./hosts/framework/home/default.nix
        ];
      };
    };
    darwinConfigurations = with inputs; {
      macbook = nixpkgs.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          ./hosts/macbook/modules/default.nix
          ./hosts/macbook/home/default.nix
        ];
      };
    };
  };
}
