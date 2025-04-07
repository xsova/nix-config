{ user, ... }:
{
  enable = true;
  userName = user;
  userEmail = "bryce@bryces.email";
  aliases = {
    co = "checkout";
    rs = "reset --hard";
  };
  # delta = {
  #   enable = true;
  #   options = {
  #     decorations = {
  #       commit-decoration-style = "bold yellow box ul";
  #       file-decoration-style = "none";
  #       file-style = "bold yellow ul";
  #     };
  #     features = "decorations";
  #     whitespace-error-style = "22 reverse";
  #   };
  # };
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
