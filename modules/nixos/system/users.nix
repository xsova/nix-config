{ pkgs, ... }: {
  users.users = {
    bryce = {
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      name = "bryce";
      shell = pkgs.fish;
      home = "/home/bryce";
    };
  };
}
