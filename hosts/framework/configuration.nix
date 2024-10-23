{ lib, inputs, pkgs, config, ... }:

{
  nixpkgs = {
    hostPlatform.system = "x86_64-linux";
    config = {
      allowUnfree = true;
    };
  };
  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      flake-registry = "";
      nix-path = config.nix.nixPath;
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
    channel.enable = true;
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    optimise.automatic = true;
  };
  users.users = {
    bryce = {
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      name = "bryce";
      shell = pkgs.fish;
      home = "/home/bryce";
    };
  };
  
  time.timeZone = "America/Chicago";
  system.stateVersion = "24.05"; # Probably don't change this
}
