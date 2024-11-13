{...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      # format = "(0x9A348E)$username$hostname$localip$shlvl$singularity$kubernetes(fg:0x9A348E bg:0xDA627D)$directory$vcsh(fg:0xDA627D bg:0xFCA17D)$git_branch$git_status$hg_branch(fg:0x86BBD8 bg:0x06969A)$docker_context$conda$memory_usage$aws$gcloud$azure$jobs$battery(fg:0x06969A bg:0x33658A)$time$status$character";
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
        stashed = "\$";
      };
    };
  };
}


