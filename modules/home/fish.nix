{
  pkgs,
  host,
  ...
}:
{
  enable = true;
  shellAliases =
    {
      ls = "lsd --classify";
      lls = "lsd --tree";
      ll = "lsd -l";
    }
    // (
      if pkgs.stdenv.isDarwin then
        {
          nixos-rebuild = "darwin-rebuild";
        }
      else
        {
          mixer = "pulsemixer";
          sudo = "/run/wrappers/bin/sudo";
        }
    );
  preferAbbrs = true;
  shellAbbrs = {
    ":q" = "exit";
    l = "ls";
    hm = "home-manager";
    lg = "lazygit";
    cl = "clear";
    ".c" = {
      expansion = "~/.config/%";
      setCursor = true;
      position = "anywhere";
    };
    cdd = {
      expansion = "cd ~/Developer/%";
      setCursor = true;
    };
    dv = {
      expansion = "~/Developer/%";
      setCursor = true;
    };
    tma = {
      expansion = "tests/manual/%";
      setCursor = true;
      position = "anywhere";
    };
    fcp = {
      expansion = "fish_clipboard_copy";
      position = "anywhere";
    };
    fc = {
      expansion = "fish_clipboard_copy";
      position = "anywhere";
    };
    fcc = {
      expansion = "fish_clipboard_copy";
      position = "anywhere";
    };
    rtg = {
      expansion = "$rtg/%";
      setCursor = true;
      position = "anywhere";
    };
    rtgt = {
      expansion = "$rtg/tests/tests/%";
      setCursor = true;
      position = "anywhere";
    };
    rtgg = {
      expansion = "cd $rtg";
    };
    rbs =
      if pkgs.stdenv.isDarwin then
        "darwin-rebuild switch --flake ~/nix#${host}"
      else
        "nixos-rebuild switch --flake ~/nix#${host}";
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
    npp = "npx playwright test";
    nppw = {
      expansion = "npx playwright test ~/dev/rtg/tests/tests/manual/%.manual.spec.ts";
      setCursor = true;
    };
    nx = {
      expansion = "~/nix/%";
      setCursor = true;
      position = "anywhere";
    };
    nf = "nix flake";
    nfu = "nix flake update";
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
    printPath = ''
      printf "%s\n" $PATH
    '';
  };
  shellInit = ''
    set -x current_shell fish
    set -x __rtg_dir ~/dev/rtg/tests
  '';
  loginShellInit =
    if pkgs.stdenv.isDarwin then
      ''
        # Nix-Darwin PATH
        fish_add_path /Users/$USER/.nix-profile/bin
        fish_add_path /Users/$USER/.local/bin
        fish_add_path /Users/$USER/bin
        fish_add_path /usr/local/bin
        fish_add_path /usr/bin
        fish_add_path /sbin
        fish_add_path /bin
        fish_add_path /Applications
        fish_add_path /Users/$USER/Applications
        fish_add_path /Library/Frameworks/Python.framework/Versions/Current/bin
        source ~/dev/rtg/tests/.config/fish/config.fish
      ''
    else
      ''
        # NixOS PATH
        fish_add_path --move --append /run/wrappers/bin
        fish_add_path /home/$USER/bin
        fish_add_path /home/$USER/.nix-profile/bin
        fish_add_path /run/current-system/sw/bin
        fish_add_path /nix/var/nix/profiles/default/bin
        fish_add_path /home/bryce/.local/bin
        fish_add_path /home/bryce/go/bin
        fish_add_path /usr/bin
        fish_add_path /usr/local/bin
        fish_add_path /usr/sbin
        fish_add_path /sbin
        fish_add_path /bin
      '';
}
