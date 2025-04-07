{ ... }:
{
  nixpkgs = {
    buildPlatform = "aarch64-darwin";
    config.allowUnfree = true;
    flake = {
      setNixPath = true;
      setFlakeRegistry = true;
    };
    hostPlatform = "aarch64-darwin";
  };
}
