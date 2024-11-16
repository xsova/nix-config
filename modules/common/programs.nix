{...}: {
  programs = {
    fish = {
      enable = true;
      useBabelfish = true;
    };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
