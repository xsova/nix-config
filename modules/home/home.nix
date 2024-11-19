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
  sessionVariables = {
    EDITOR = "hx";
    VISUAL = "fleet";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    IWD = "($PWD)";
    NODE_EXTRA_CA_CERTS = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };
  sessionPath =
    (
      if darwin
      then ["/opt/homebrew/bin"]
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
