{
  user,
  pkgs,
  ...
}:
{
  name = user;
  home = "/Users/${user}";
  shell = pkgs.fish;
}
