{ ... }:

{
  imports = [
    ./homebrew
    ./lsp
    ./devtools
    ./nix-settings
    ./cli-tools
    ./programming-languages
    ./rust
    ./services
    ./system
    ./security # TODO: Check out nix-darwin security options
    ./users
    ./skhd
    ./yabai
    ./pinix
  ];
}

