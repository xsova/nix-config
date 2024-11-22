{
  enable = true;
  settings = {
    listen_addresses = [
      "127.0.0.1:53"
      "[::1]:53"
    ];
    ipv6_servers = true;
    require_dnssec = true;
    sources.public_resolvers = {
      urls = [
        "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
        "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
      ];
      cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
      minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
    };
    server_names = [
      "cloudflare"
      "cloudflare-ipv6"
      "cloudflare-security"
      "cloudflare-security-ipv6"
      "adguard-dns-doh"
      "mullvad-adblock-doh"
      "mullvad-doh"
      "nextdns"
      "nextdns-ipv6"
      "quad9-dnscrypt-ipv4-filter-pri"
      "google"
      "google-ipv6"
      "ibksturm"
    ];
  };
}
