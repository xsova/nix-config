{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [
    inputs.rust-overlay.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)
    taplo
    cargo-watch
    cargo-deny
    cargo-audit
    cargo-update
    cargo-edit
    cargo-outdated
    cargo-license
    cargo-tarpaulin
    cargo-cross
    cargo-zigbuild
    cargo-nextest
    cargo-spellcheck
    cargo-modules
    cargo-bloat
    cargo-unused-features
    bacon
    evcxr # rust repl
  ];
}
