{
  # lib,
  inputs,
  ...
}: {
  nix = {
    settings = {
      allowed-users = ["@admin" "root" "bryce"];
      trusted-users = ["@admin" "bryce" "root"];
      # keep-derivations = true;
      # keep-outputs = true;
      max-jobs = "auto";
      sandbox = false;
      experimental-features = ["nix-command" "flakes"];
      # nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
      warn-dirty = false;
      substituters = [
        "https://cache.lix.systems"
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
  };
  nixpkgs.config.allowUnfree = true;
}
