{ hostname, ... }:

{
  networking = {
    enableIPv6 = false;
    hostName = "${hostname}";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
    };
  };
}

