{ user, ... }:
{
  enable = true;
  userName = user;
  userEmail = "bryce@bryces.email";
  aliases = {
    co = "checkout";
    rs = "reset --hard";
  };
  difftastic.enable = true;
  extraConfig = {
    core = {
      whitespace = "trailing-space,space-before-tab";
    };
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
