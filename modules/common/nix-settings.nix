{ lib, inputs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      Hour = 3;
      Minute = 15;
      Weekday = 7;
    };
    # This will add each flake input as a registry to make nix3 commands consistent with your flake.
    registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = [ "/etc/nix/path" ];
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
