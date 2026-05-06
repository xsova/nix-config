{ username, ... }:
{
  enable = true;
  settings = {
    user = {
      email = "bryce@bryces.email";
      name = username;
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
  };
}
