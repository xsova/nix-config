{
  description = "Nix flake for NixOS on a laptop, desktop, server, and Macbook (NixDarwin)";

  inputs = {
    fh                = { url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";                    inputs.nixpkgs.follows = "nixpkgs";   };
    fw-fanctrl        = { url = "github:TamtamHero/fw-fanctrl/packaging/nix";                               inputs.nixpkgs.follows = "nixpkgs";   };
    home-manager      = { url = "github:nix-community/home-manager";                                        inputs.nixpkgs.follows = "nixpkgs";   };
    hyprland-plugins  = { url = "github:hyprwm/hyprland-plugins";                                           inputs.hyprland.follows = "hyprland"; };
    lix               = { url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz"; inputs.nixpkgs.follows = "nixpkgs";   };
    nix-darwin        = { url = "github:LnL7/nix-darwin";                                                   inputs.nixpkgs.follows = "nixpkgs";   };
    nix-index         = { url = "github:nix-community/nix-index-database";                                  inputs.nixpkgs.follows = "nixpkgs";   };
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/0.1.5.tar.gz";
    hardware.url      = "github:NixOS/nixos-hardware/master";
    hyprland.url      = "github:hyprwm/Hyprland";
    pinix.url         = "github:remi-dupre/pinix";
    ragenix.url       = "github:yaxitech/ragenix";
    nixpkgs.url       = "github:NixOS/nixpkgs/nixpkgs-unstable";
    rust-overlay.url  = "github:oxalica/rust-overlay";
    zig-overlay.url   = "github:mitchellh/zig-overlay";
    nur.url           = "github:nix-community/nur";
  };

  outputs = inputs @ {self, ...}: {
    schemas = inputs.flake-schemas.schemas;
    overlays = with inputs; [ nur.overlay rust-overlay.overlays.default zig-overlay.overlays.default ];
    darwinConfigurations = {
      port = import ./hosts/port { inherit inputs self; };
    };
    nixosConfigurations = {
      starboard = import ./hosts/starboard {inherit inputs self;};
    };
  };
}
