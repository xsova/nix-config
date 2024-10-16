{ ... }:

{
  imports = [
    ./nix-settings
    ./users
    ./home-manager
    ./networking
    ./security/default.nix # FIXME: Add in security hardening stuff that is common
    ./locale
    ./fonts
    ./services
    ./packages
    ./time
    ./system
  ];
}
