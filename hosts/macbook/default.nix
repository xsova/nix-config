{ ... }:

{
  system.stateVersion = 5;
  imports = [
    ../../modules/common/users
    ../../modules/darwin
    ../../home/darwin/default.nix
  ];
}
