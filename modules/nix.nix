{
  lib,
  inputs,
  ...
}: {
  nix = {
    settings = {
      allowed-users = ["root" "bryce"];
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
      cores = 6;
      max-jobs = 10;
      sandbox = false;
      nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
  };
}
