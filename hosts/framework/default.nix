{ ... }:

{
  imports = [
    ./hardware-configuration # FIXME: Make this the output of nixos-generate-config
    ../../home/common/default.nix
    ../../home/framework/default.nix
    ../../modules/common
    ../../modules/desktop
    ../../modules/laptop
  ];
}
