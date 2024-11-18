{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    age-plugin-yubikey
    yubico-piv-tool
    yubikey-manager
  ];
}
