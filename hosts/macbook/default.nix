{ ... }:

{
  imports = [
    ../home/default.nix
    ./homebrew.nix
    ./lsp.nix
    ./devtools.nix
    ./nix.nix-settings
    ./cli.nix-tools
    ./programming.nix-languages
    ./rust.nix
    ./services.nix
    ./system.nix
    ./security.nix # TODO: Check out nix-darwin security options
    ./users.nix
    ./skhd.nix
    ./yabai.nix
    ./pinix.nix
  ];
}

