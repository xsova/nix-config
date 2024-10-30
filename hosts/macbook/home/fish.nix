{ lib, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {};
    shellAbbrs = {
      "g" = "git";
      "ga" = "git add";
      "gcl" = "git clean";
      "gcmt" = "git commit -am";
      "gc" = "git clone";
      "gl" = "git log";
      "gpll" = "git pull";
      "gpsh" = "git push";
      "grestart" = "git reset --hard && git clean -fdx";
      "grm" = "git rm";
      "gsh" = "git stash";
      "gst" = "git status -sb";
      "gwhoami" = "echo \"user.name: \" (git config user.name) && echo \"user.email: (git config user.email)\"";
      "cdw" = "cd ~/work/";
      "db" = "darwin-rebuild switch --flake ~/.config/nix-darwin#bryces-laptop";
      "s" = "sudo";
      "nv" = "nvim";
      ":q" = "exit";
      "z" = "zellij";
      "cat" = "bat";
      "ls." = "ls -ld .*";
      "h" = "hx";
      "e" = "$EDITOR";
      "d" = "(cd ~/nix && git add -A) && darwin-rebuild switch --flake ~/nix#macbook";
      "cddg" =    { setCursor = true; expansion = "cd ~/Developer/Github/%"; };
      "cdd" =     { setCursor = true; expansion = "cd ~/Developer/%"; };
      "fzf" =     { setCursor = true; expansion = "fzf --preview \"bat --color=always --style=numbers --line-range=:500 {}\""; };
      "tail -f" = { setCursor = true; expansion = "tail -f % | bat --paging=never -l log"; };
      "enx" =     { setCursor = true; expansion = "$EDITOR ~/.config/nix-darwin/%"; };
      ".c" =      { setCursor = true; position = "anywhere"; expansion = "~/.config/%"; };
      ".n" =      { setCursor = true; position = "anywhere"; expansion = "~/nix/%"; };
      "mb" =      { setCursor = true; position = "anywhere"; expansion = "~/nix/hosts/macbook/%"; };
      "fw" =      { setCursor = true; position = "anywhere"; expansion = "~/nix/hosts/framework/%"; };
      "cdc" =     { setCursor = true; expansion = "cd ~/.config/%"; };
      "-h" =      { position = "anywhere"; expansion = "-h 2>&1 | bat --language=help --style=plain"; };
      "--help" =  { position = "anywhere"; expansion = "--help 2>&1 | bat --language=help --style=plain"; };
    };
    functions = {};
    shellInit = ''
      set -q __fish_config_dir;  or set -Ux __fish_config_dir $XDG_CONFIG_HOME/fish
      set -q __fish_data_dir;    or set -Ux __fish_data_dir $XDG_DATA_HOME/fish
      set -q __fish_cache_dir;   or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
      set -q __fish_plugins_dir; or set -Ux __fish_plugins_dir $__fish_config_dir/plugins
      set -q fisher_path;        or set -gx fisher_path $__fish_config_dir/.fisher
    '';
    loginShellInit = let
      profiles = [
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
    '';
  };  
}


