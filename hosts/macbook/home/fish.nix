{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      "darwin-rebuild" = "sudo pinix darwin-rebuild"
    };
    shellAbbrs = {
      "cdd" = {
        setCursor = true;
        expansion = "cd ~/Developer/%";
      };
      "ea" = "$EDITOR ~/.config/nix-darwin/home-manager/fish/default.nix";
      "ef" = "$EDITOR ~/.config/nix-darwin/home-manager/fish/default.nix";
      "eh" = "$EDITOR ~/.config/nix-darwin/home-manager/helix/default.nix";
      "ew" = "$EDITOR ~/.config/nix-darwin/home-manager/wezterm/default.nix";
      "g" = "git";
      "gad" = "git add";
      "gcl" = "git clean";
      "gcmt" = "git commit -am";
      "get" = "git clone";
      "glg" = "git log";
      "gpll" = "git pull";
      "gpsh" = "git push";
      "grestart" = "git reset --hard && git clean -fdx";
      "grm" = "git rm";
      "gsh" = "git stash";
      "gst" = "git status -sb";
      "gwhoami" = "echo \"user.name: \" (git config user.name) && echo \"user.email: (git config user.email)\"";
      "fzf" = {
        setCursor = true;
        expansion = "fzf --preview \"bat --color=always --style=numbers --line-range=:500 {}\"";
      };
      "tail -f" = {
        setCursor = true;
        expansion = "tail -f % | bat --paging=never -l log";
      };
      "enx" = {
        setCursor = true;
        expansion = "$EDITOR ~/.config/nix-darwin/%";
      };
      ".c" = {
        setCursor = true;
        position = "anywhere";
        expansion = "~/.config/%";
      };
      "-h" = {
        position = "anywhere";
        expansion = "-h 2>&1 | bat --language=help --style=plain";
      };
      "--help" = {
        position = "anywhere";
        expansion = "--help 2>&1 | bat --language=help --style=plain";
      };
      "db" = "darwin-rebuild switch --flake ~/.config/nix-darwin#bryces-laptop";
      "s" = "sudo";
      "nv" = "nvim";
      ":q" = "exit";
      "z" = "zellij";
      "cat" = "bat";
      "ls." = "ls -ld .*";
      "cdc" = {
        setCursor = true;
        expansion = "cd ~/.config/%";
      };
      "h" = "hx";
      "e" = "$EDITOR";
      "cddg" = {
        setCursor = true;
        expansion = "cd ~/Developer/Github/%";
      };
      "d" = "(cd ~/nix && git add -A) && darwin-rebuild switch --flake ~/nix#macbook";
    };
    functions = {
      parse_nix = ''
          for nix_file in (find . -name '*.nix')
            echo "\n"
            echo "File: $nix_file"
            echo "---------------\n"
            nix-instantiate --parse $nix_file
          end
        '';
    };
    shellInit = ''
      set -q __fish_config_dir;  or set -Ux __fish_config_dir $XDG_CONFIG_HOME/fish
      set -q __fish_data_dir;    or set -Ux __fish_data_dir $XDG_DATA_HOME/fish
      set -q __fish_cache_dir;   or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
      set -q __fish_plugins_dir; or set -Ux __fish_plugins_dir $__fish_config_dir/plugins
      set -q fisher_path;        or set -gx fisher_path $__fish_config_dir/.fisher
      
      fish_add_path --path ~/.local/bin
      fish_add_path --path ~/go/bin
      fish_add_path --path $DENO_INSTALL/bin
      fish_add_path --path /usr/local/bin
      fish_add_path --append /usr/bin
      fish_add_path --append /usr/sbin
      fish_add_path --append /bin
      fish_add_path --append /sbin
    '';
  };  
}


