{ inputs, pkgs, ... }:

{
  imports = [
    inputs.ragenix.darwinModules.default
  ];
  environment.systemPackages = with pkgs; [
    age-plugin-yubikey
    yubico-piv-tool
    yubikey-manager
  ];
}
