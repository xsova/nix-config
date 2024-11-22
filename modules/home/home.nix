{
  pkgs,
  user,
  darwin ? false,
  ...
}: let
  homeDir =
    if darwin
    then "/Users/${user}"
    else "/home/${user}";
in {
  stateVersion = "24.05";
  username = user;
  homeDirectory = homeDir;
  sessionVariables =
    {
      EDITOR = "hx";
      VISUAL = "fleet";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      IWD = "($PWD)";
      NODE_EXTRA_CA_CERTS = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
      # RUST_SRC_PATH = "${pkgs.rustToolchain}/lib/rustlib/src/rust/library";
    }
    // (
      if darwin
      then {
        PLAYDATE_SDK_PATH = "/Users/${user}/Developer/PlaydateSDK";
      }
      else {}
    );
  sessionPath =
    (
      if darwin
      then [
        "/opt/homebrew/bin"
        "/Users/${user}/Developer/PlaydateSDK/bin"
      ]
      else []
    )
    ++ [
      "${homeDir}/.nix-profile/bin"
      "${homeDir}/.local/bin"
      "${homeDir}/bin"
      "${homeDir}/go/bin"
      "/run/current-system/sw/bin"
      "/nix/var/nix/profiles/default/bin"
      "/usr/bin"
      "/bin"
      "/usr/local/bin"
      "/usr/sbin"
      "/sbin"
    ];
}
