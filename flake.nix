{
  description = "Nix flake for NixOS on a laptop, desktop, server, and Macbook (NixDarwin)";

  inputs = {
    fh = { url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz"; inputs.nixpkgs.follows = "nixpkgs"; };
    fw-fanctrl = { url = "github:TamtamHero/fw-fanctrl/packaging/nix"; inputs.nixpkgs.follows = "nixpkgs"; };
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    hyprland-plugins = { url = "github:hyprwm/hyprland-plugins"; inputs.hyprland.follows = "hyprland"; };
    nix-darwin = { url = "github:LnL7/nix-darwin"; inputs.nixpkgs.follows = "nixpkgs"; };
    nix-index = { url = "github:nix-community/nix-index-database"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/0.1.5.tar.gz";
    hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "github:hyprwm/Hyprland";
    pinix.url = "github:remi-dupre/pinix";
    ragenix.url = "github:yaxitech/ragenix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    zig-overlay.url = "github:mitchellh/zig-overlay";
    nur.url = "github:nix-community/nur";
    textfox.url = "github:adriankarlen/textfox";
  };

  outputs =
    inputs@{ self, ... }:
    {
      schemas = inputs.flake-schemas.schemas;
      formatter.aarch64-darwin = inputs.nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
      overlays = with inputs; [ nur.overlays.default rust-overlay.overlays.default zig-overlay.overlays.default ];
      darwinConfigurations.port = import ./host/shell { inherit inputs self; }; # Macbook M4 Pro Max
      nixosConfigurations = {
        core = import ./host/core { inherit inputs self; }; # Framework 13 AMD
        forge = import ./host/forge { inherit inputs self; }; # Custom PC
        hub = import ./host/hub { inherit inputs self; }; # Dell R710
        vault = import ./host/vault { inherit inputs self; }; # HP MicroServer Gen8
        node = import ./host/node { inherit inputs self; }; # ZimaBlade
      };
    };
}
