{ lib, ... }:

{
  options = with lib; with types; {
    systemStateVersion = mkOption { type = int; };
    homeStateVersion = mkOption { type = str; };
    user = mkOption { type = str; };
    homePath = mkOption { type = str; };
    hostname = mkOption { type = str; };
    flakePath = mkOption { type = str; };
    gitUsername = mkOption { type = str; };
    gitEmail = mkOption { type = str; };
    platform = mkOption { type = str; };
  };
}