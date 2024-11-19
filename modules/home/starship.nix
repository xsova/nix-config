{
  enable = true;
  settings = {
    add_newline = false;
    command_timeout = 500;
    right_format = "";
    scan_timeout = 30;

    nix_shell = {
      symbol = "❄️ ";
      format = "$symbol";
      impure_msg = "[$symbol](bright-purple bold)";
      pure_msg = "[$symbol](bright-blue bold)";
      style = "bright-purple bold";
    };

    package = {
      disabled = true;
    };

    nodejs = {
      disabled = true;
    };

    git_status = {
      conflicted = "!";
      ahead = "⇡";
      behind = "⇣";
      staged = "+";
      modified = "~";
      deleted = "x";
      untracked = "?";
      stashed = "_";
    };
  };
}
