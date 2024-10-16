{ ... }:

{
  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    printing.enable = false;
    clamav.enable = true;
  };
}
