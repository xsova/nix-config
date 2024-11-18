{...}: {
  imports = [
    ./cli.nix
    # ./direnv.nix
    ./environment.nix
    ./fonts.nix
    ./nix-settings.nix
    ./packages.nix
    ./programs.nix
    ./rust.nix
    ./security.nix
    # ./services.nix
    ./time.nix
    ./developer
  ];
}
