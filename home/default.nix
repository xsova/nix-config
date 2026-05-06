{
  username,
  pkgs,
  lib,
  ...
}:
{
  home =
    let
      homeDir = "/Users/${username}";
    in
    {
      stateVersion = "24.05";
      username = username;
      homeDirectory = homeDir;
      sessionVariables = {
        LIBRARY_PATH = ''${lib.makeLibraryPath [ pkgs.libiconv ]}''${LIBRARY_PATH:+$LIBRARY_PATH}'';
        EDITOR = "hx";
        VISUAL = "cursor";
        MANPAGER = "sh -c 'col -bx | bat -l man -p'";
        IWD = "($PWD)";
        NODE_EXTRA_CA_CERTS = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
        PLAYDATE_SDK_PATH = "${homeDir}/Developer/PlaydateSDK";
      };
      sessionPath = [
        "/run/current-system/sw/bin"
        "/opt/homebrew/bin"
        "${homeDir}/.local/bin"
        "${homeDir}/bin"
        "${homeDir}/go/bin"
        "${homeDir}/Developer/PlaydateSDK/bin"
        "/Library/Frameworks/Python.framework/Versions/Current/bin"
        "/usr/local/bin"
        "/usr/bin"
        "/usr/sbin"
        "/sbin"
        "/bin"
      ];
    };
  catppuccin = import ./catppuccin.nix;
  programs = {
    fish = import ./fish.nix { inherit username; };
    alacritty = import ./alacritty.nix { inherit lib pkgs; };
    helix = import ./helix.nix { inherit lib pkgs; };
    git = import ./git.nix { inherit username; };
    gh = import ./gh.nix;
    ghostty = import ./ghostty.nix;
    # gitui = import ./gitui.nix;
  };
}
