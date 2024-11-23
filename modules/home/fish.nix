{
  lib,
  darwin ? false,
  host,
  pkgs,
  ...
}: {
  enable = true;
  shellAliases = {
    nixos-rebuild =
      if darwin
      then "darwin-rebuild"
      else "pinix nixos-rebuild";
    ls = "lsd";
  };
  preferAbbrs = true;
  shellAbbrs = {
    lg = "lazygit";
    cl = "clear";
    cdd = {
      expansion = "cd ~/Developer/%";
      setCursor = true;
    };
    dv = {
      expansion = "~/Developer/%";
      setCursor = true;
    };
    rbs =
      if darwin
      then "darwin-rebuild switch --flake ~/nix#${host}"
      else "nixos-rebuild switch --flake ~/nix#${host}";
    cat = "bat";
    dots = "ls -ld .*";
    e = "hx";
    g = "git";
    ga = "git add";
    gaa = "git add -A";
    gc = "git clone";
    gcl = "git clean";
    gcmt = "git commit -am";
    gl = "git log";
    gpll = "git pull";
    gpsh = "git push";
    grestart = "git reset --hard && git clean -fdx";
    grm = "git rm";
    gsh = "git stash";
    gst = "git status -sb";
    gwhoami = "echo \"user.name: \" $(git config user.name) && echo \"user.email: $(git config user.email)\"";
    h = "hx";
    qq = "exit";
    z = "zellij";
    hd = {
      expansion = "cd ~/Developer/%";
      setCursor = true;
    };
    ef = "hx ~/nix/flake.nix";
    enx = {
      expansion = "hx ~/nix/%";
      setCursor = true;
    };
    fw = {
      expansion = "~/nix/hosts/framework/%";
      setCursor = true;
      position = "anywhere";
    };
    fzf = {
      expansion = "fzf --preview \"bat --color=always --style=numbers --line-range=:500 {}\"";
      setCursor = true;
    };
    msp = {
      expansion = "~/Developer/exchange-automated-ui/";
      position = "anywhere";
    };
    msps = {
      expansion = "~/Developer/exchange-automated-ui/src/%";
      setCursor = true;
      position = "anywhere";
    };
    mspst = {
      expansion = "~/Developer/exchange-automated-ui/src/tests/%";
      setCursor = true;
      position = "anywhere";
    };
    nx = {
      expansion = "~/nix/%";
      setCursor = true;
      position = "anywhere";
    };
    nxd = {
      expansion = "nix develop % -c fish";
      setCursor = true;
    };
    "--help" = {
      expansion = "--help 2>&1 | bat --language=help --style=plain";
      position = "anywhere";
    };
    "-h" = {
      expansion = "-h 2>&1 | bat --language=help --style=plain";
      position = "anywhere";
    };
    "tail -f" = {
      expansion = "tail -f % | bat --paging=never -l log";
      setCursor = true;
    };
  };
  functions = {
    __setup_hm_session_vars = ''
      if test -f "$HOME/.nix-profile/profile.d/hm-session-vars.sh"
        source "$HOME/.nix-profile/profile.d/hm-session-vars.sh"
      end
    '';
  };
  shellInit = ''
    set -x current_shell fish
    set -q __fish_config_dir;  or set -Ux __fish_config_dir $XDG_CONFIG_HOME/fish
    set -q __fish_data_dir;    or set -Ux __fish_data_dir $XDG_DATA_HOME/fish
    set -q __fish_cache_dir;   or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
    set -q __fish_plugins_dir; or set -Ux __fish_plugins_dir $__fish_config_dir/plugins
    set -q fisher_path;        or set -gx fisher_path $__fish_config_dir/.fisher
  '';
  loginShellInit = let
    profiles = [
      "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/bin"
      "${pkgs.zls}/bin"
      "/etc/profiles/per-user/$USER"
      "$HOME/.nix-profile"
      "(set -q XDG_STATE_HOME; and echo $XDG_STATE_HOME; or echo $HOME/.local/state)/nix/profile"
      "/run/current-system/sw"
      "/nix/var/nix/profiles/default"
    ];
    mkBinSearchPath =
      lib.concatMapStringsSep " " (path: "${path}/bin");
  in ''
    fish_add_path --move --prepend --path ${mkBinSearchPath profiles}
    set fish_user_paths $fish_user_paths
    __setup_hm_session_vars
  '';
}
