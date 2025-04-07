{ inputs, pkgs, ... }:
{
  environment.systemPackages = [ inputs.fh.packages.aarch64-darwin.default ];
}
