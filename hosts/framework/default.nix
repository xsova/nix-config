{ ... }:

{
  imports = [
    ./hardware-configuration # FIXME: Make this the output of nixos-generate-config
    ./disko/default.nix
  ];
}
