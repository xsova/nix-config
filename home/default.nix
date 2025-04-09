{
  username,
  pkgs,
  lib,
  ...
}:
{
  home = {
    stateVersion = "24.05";
    username = username;
    homeDirectory = "/Users/${username}";
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "cursor";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      IWD = "($PWD)";
      NODE_EXTRA_CA_CERTS = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
      PLAYDATE_SDK_PATH = "/Users/${username}/Developer/PlaydateSDK";
    };
    sessionPath = [
      "/Users/${username}/.nix-profile/bin"
      "/Users/${username}/.local/bin"
      "/Users/${username}/bin"
      "/Users/${username}/go/bin"
      "/run/current-system/sw/bin"
      "/nix/var/nix/profiles/default/bin"
      "/opt/homebrew/bin"
      "/Library/Frameworks/Python.framework/Versions/Current/bin"
      "/Users/${username}/Developer/PlaydateSDK/bin"
      "/usr/local/bin"
      "/usr/bin"
      "/usr/sbin"
      "/sbin"
      "/bin"
    ];
  };
  programs = {
    fish = import ./fish.nix { inherit username; };
    alacritty = import ./alacritty.nix { inherit lib pkgs; };
    helix = import ./helix.nix { inherit lib pkgs; };
    git = import ./git.nix { inherit username; };
    gh = import ./gh.nix;
    gitui = import ./gitui.nix;
  };
}
