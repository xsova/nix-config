{
  description = "General Nix flake for all my machines. (NixOS, NixWSL, Darwin-Nix)";

  inputs = {                                               
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";                                # Default nixpkgs repository.
    nixos-wsl.url = "github:nix-community/NixOS-WSL";                                     # WSL nixOS compatibility
    nixos-darwin.url = "github:LnL7/nix-darwin";                                          # Nix on MacOS compatibility
    home-manager.url = "github:nix-community/home-manager";                               # ~/.config management through nix
    nix-index.url = "github:nix-community/nix-index-database";                            # Indexing the nixpkgs db for performance
    hyprland.url = "github:hyprwm/Hyprland";                                              # Hyprland tiling wm on linux
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";                              # Plugins for hyprland
    pinix.url = "github:remi-dupre/pinix";                                                # Progress viewing tool for nix
    rust-overlay.url = "github:oxalica/rust-overlay";                                     # Bleeding edge rust crates source.
    hardware.url = "github:NixOS/nixos-hardware/master";                                  # NixOS hardware tooling.
    fw-fanctrl.url = "github:TamtamHero/fw-fanctrl/packaging/nix";                        # Framework laptop fan controls
    lix.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz"; # Lix (Like Nix)
    alejandra.url = "github:kamadorueda/alejandra/3.1.0";                                 # Nix DSL formatter

    # Ensure matching nixpkgs versions.
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
    nix-index.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    nixos-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    fw-fanctrl.inputs.nixpkgs.follows = "nixpkgs";
    lix.inputs.nixpkgs.follows = "nixpkgs";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    darwinConfigurations = with inputs; {
      macbook = nixos-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          lix.nixosModules.default
          nix-index.darwinModules.nix-index
          home-manager.darwinModules.home-manager
          { imports = [ ./hosts/macbook/home ]; }
          ./hosts/macbook
        ];
      };
    };
    nixosConfigurations = with inputs; { 
      # if you change `wsl` on the next line to your hostname,
      # you don't have to specify which configuration to build/switch.
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          lix.nixosModules.default
          nixos-wsl.nixosModules.wsl
          nix-index.nixosModules.nix-index
          home-manager.nixosModules.home-manager 
          { imports = [ ./hosts/wsl/home ]; }
          ./hosts/wsl
        ];
      };
      framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          lix.nixosModules.default
          nix-index.nixosModules.nix-index
          hardware.nixosModules.framework-13-7040-amd
          home-manager.nixosModules.home-manager
          { imports = [ ./hosts/framework/home ]; }
          ./hosts/framework
        ];
      };
    };
  };
}
