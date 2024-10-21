{ ... }:

{
  imports = [
    ./nix-settings.nix
    ./users.nix
    ./home-manager.nix
    ./networking.nix
    ./security.nix # FIXME: Add in security hardening stuff that is common
    ./locale.nix
    ./fonts.nix
    ./services.nix
    ./packages.nix
    ./time.nix
    ./system.nix
  ];
}
