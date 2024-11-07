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
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    pinix.url = "github:remi-dupre/pinix";
    rust-overlay.url = "github:oxalica/rust-overlay";
    hardware.url = "github:NixOS/nixos-hardware/master";
    ragenix.url = "github:yaxitech/ragenix";
    fw-fanctrl = {
      url = "github:TamtamHero/fw-fanctrl/packaging/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # secrets = { url = "github:xsova/nix-secrets"; flake = false; };
    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    darwinConfigurations = with inputs; {
      macbook = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          nix-index.darwinModules.nix-index
          home-manager.darwinModules.home-manager { imports = [ ./hosts/macbook/home ]; }
          lix.nixosModules.default
          ./hosts/macbook
        ];
      };
    };
    nixosConfigurations = with inputs; { 
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          nix-index.nixosModules.nix-index # Indexing for finding nixpkgs faster
          nixos-wsl.nixosModules.wsl # WSL stuff
          lix.nixosModules.default # Use Lix instead of Nix
          home-manager.nixosModules.home-manager { imports = [ ./hosts/wsl/home ]; } # Home manager configurations
          ./hosts/wsl # Host configurations
        ];
      };
      framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          home-manager.nixosModules.home-manager
          nix-index.nixosModules.nix-index
          hardware.nixosModules.framework-13-7040-amd
          ./hosts/framework
        ];
      };
    };
  };
}
