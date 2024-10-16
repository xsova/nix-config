{ ... }:

{
  imports = [
    ./hardware-configuration/default.nix
    ../../modules/common/default.nix
    ../../modules/desktop/default.nix
    ../../modules/intel-cpu/default.nix
    ../../modules/nvidia/default.nix
    ./networking/default.nix
    ./boot/default.nix
    ./services/default.nix
    ./programs/default.nix
  ];
}
