{
  user,
  pkgs,
  ...
}: {
  ${user} = {
    name = user;
    initialPassword = "password";
    isNormalUser = true;
    extraGroups = ["wheel"];
    home = "/home/${user}";
    shell = pkgs.fish;
  };
}
