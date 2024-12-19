{ ... }:

{
  imports = [
    ./hardware-configuration/default.nix
    ../../modules/common/default.nix
    ../../modules/server/default.nix
  ];
}
