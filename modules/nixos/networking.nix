{
  networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
  wireless.iwd = {
    enable = true;
    settings = {
      General = {
        EnableNetworkConnection = true;
      };
      Network = {
        EnableIPv6 = true;
      };
      Scan = {
        DisablePeriodicScan = true;
      };
    };
  };
  enableIPv6 = false;
  hostName = "framework";
  firewall = {
    enable = true;
    allowedTCPPorts = [80 443];
  };
  nameservers = ["127.0.0.1" "[::1]"];
  dhcpcd.enable = false;
  dhcpcd.extraConfig = "nohook resolv.conf";
  networkmanager.dns = "none";
}
