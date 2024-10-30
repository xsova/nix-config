{ lib, inputs, ... }:

{
  nix = {
    settings = {
      allowed-users = [ "root" "bryce" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      auto-optimise-store = true;
      cores = 6;
      max-jobs = 10;
      sandbox = false;
      nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
    };
    registry = {
      nixpkgs.flake = inputs.nixpkgs;
    };
  };
  environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    flake = {
      setFlakeRegistry = true;
      setNixPath = true;
    };
    buildPlatform = "aarch64-darwin";
    hostPlatform = "aarch64-darwin";
  };
  environment.extraInit = let
    homeManagerSessionVars = 
      "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh";
    in ''
      [[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars}
    '';
}
