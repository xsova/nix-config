{ pkgs, ... }:

{
  users.users.bryce = {
    name = "bryce";
    home = "/Users/bryce";
    shell = pkgs.fish;
  };
}
