{ ... }: {
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    # enableFishIntegration = true;
    # loadInNixShell = true;
    nix-direnv.enable = true;
    silent = true;
  };
}

