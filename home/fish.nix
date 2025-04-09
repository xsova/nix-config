{ username, ... }:
{
  enable = true;
  shellAliases = {
    ls = "lsd --classify";
    lls = "lsd --tree";
    ll = "lsd -l";
  };
  preferAbbrs = true;
  shellAbbrs = {
    ":q" = "exit";
    "qq" = "exit";
    "qqq" = "exit";
    l = "ls";
    lg = "lazygit";
    cl = "clear";
    cdd = {
      expansion = "cd ~/Developer/%";
      setCursor = true;
    };
    cat = "bat";
    e = "hx";
    g = "git";
    ga = "git add";
    gaa = "git add -A";
    gc = "nix-collect-garbage";
    z = "zellij";
    nx = {
      expansion = "~/nix/%";
      setCursor = true;
      position = "anywhere";
    };
    nf = "nix flake";
    nfu = "nix flake update";
  };
  functions = {
    __setup_hm_session_vars = ''
      if test -f "$HOME/.nix-profile/profile.d/hm-session-vars.sh"
        source "$HOME/.nix-profile/profile.d/hm-session-vars.sh"
      end
    '';
  };
  shellInit = "set -x current_shell fish";
  loginShellInit = ''
    fish_add_path /Users/${username}/.nix-profile/bin
    fish_add_path /Users/${username}/.local/bin
    fish_add_path /Users/${username}/bin
    fish_add_path /Users/${username}/go/bin
    fish_add_path /run/current-system/sw/bin
    fish_add_path /nix/var/nix/profiles/default/bin
    fish_add_path /Applications
    fish_add_path /Users/${username}/Applications
    fish_add_path /opt/homebrew/bin
    fish_add_path /Users/${username}/Developer/PlaydateSDK/bin
    fish_add_path /Library/Frameworks/Python.framework/Versions/Current/bin
    fish_add_path /usr/local/bin
    fish_add_path /usr/bin
    fish_add_path /usr/sbin
    fish_add_path /sbin
    fish_add_path /bin
  '';
}
