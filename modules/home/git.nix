{user, ...}: {
  enable = true;
  userName = user;
  userEmail = "bryce@bryces.email";
  extraConfig = {
    color = {
      ui = "auto";
    };
    pull = {
      rebase = true;
    };
    push = {
      default = "simple";
    };
  };
}
