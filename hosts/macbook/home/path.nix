{ home, ... }:

{
  home.sessionPath = [
    "/Users/bryce/.nix-profile/bin"
    "/Users/bryce/.local/bin"
    "/Users/bryce/go/bin"
    "/run/current-system/sw/bin"
    "/opt/homebrew/bin"
    "/nix/var/nix/profiles/default/bin"
    "/usr/bin"
    "/bin"
    "/usr/local/bin"
    "/usr/sbin"
    "/sbin"
    "$DENO_INSTALL/bin"
  ];
}
