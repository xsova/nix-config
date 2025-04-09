{
  inputs,
  username,
  pkgs,
  platform,
  self,
  lib,
  ...
}:
{
  nix = {
    enable = true;
    package = pkgs.nix;
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = false;
      allowed-users = [
        "@admin"
        "root"
        "${username}"
      ];
      trusted-users = [
        "@admin"
        "root"
        "${username}"
      ];
      max-jobs = "auto";
      sandbox = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
      substituters = [
        "https://cache.lix.systems"
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = platform;
    buildPlatform = platform;
    flake = {
      setNixPath = true;
      setFlakeRegistry = true;
    };
    overlays = self.overlays;
  };
}
