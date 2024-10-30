{ ... }:

{
  imports = [
    ./secrets.nix
    ./homebrew.nix
    ./lsp.nix
    ./devtools.nix
    ./nix-settings.nix
    ./cli-tools.nix
    ./programming-languages.nix
    ./rust.nix
    ./services.nix
    ./system.nix
    ./security.nix # TODO: Check out nix-darwin security options
    ./users.nix
    ./skhd.nix
    ./yabai.nix
    ./jankyborders.nix
    ./pinix.nix
  ];
}

