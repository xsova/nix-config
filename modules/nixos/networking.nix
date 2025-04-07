{ host, ... }:
{
  hostName = host;
  networkmanager = {
    enable = true;
    wifi.backend = "iwd";
    dns = "none";
  };
  wireless.iwd = {
    enable = true;
    settings = {
      Settings = {
        AutoConnect = true;
      };
      General = {
        EnableNetworkConnection = true;
      };
      Network = {
        EnableIPv6 = true;
        NameResolvingService = "none";
      };
      Scan = {
        DisablePeriodicScan = false;
      };
    };
  };
  enableIPv6 = false;
  firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
    ];
  };
  nameservers = [
    "127.0.0.1"
    "[::1]"
  ];
  dhcpcd.extraConfig = "nohook resolv.conf";
  resolvconf = {
    enable = true;
    useLocalResolver = true;
  };
}
