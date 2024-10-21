{ ... }:

{
  nix = {
    settings = {
      allowed-users = [ "root" "bryce" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      auto-optimise-store = true;
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
