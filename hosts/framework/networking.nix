{ ... }:

{
  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
    hostName = "framework";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
    };
  };
}
