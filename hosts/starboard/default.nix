{
  inputs,
  self,
  ...
}:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {inherit inputs;};
  modules = let
    user = "bryce";
    host = "starboard";
  in [
    inputs.hardware.nixosModules.framework-13-7040-amd
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index.nixosModules.nix-index
    inputs.lix.nixosModules.default
    ({
      inputs,
      pkgs,
      ...
    }: {
      system = {
        configurationRevision = self.rev or self.dirtyRev or null;
        stateVersion = "24.05";
      };
      time.timeZone = "America/Chicago";
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      environment = import ../../modules/common/environment.nix {inherit pkgs inputs;};
      nixpkgs = let
        platform = "x86_64-linux";
      
        import ../../modules/common/nixpkgs.nix {inherit platform self;};
      users.users = {
        ${user} = {
          name = user;
          initialPassword = "password";
          isNormalUser = true;
          extraGroups = ["wheel"];
          home = "/home/${user}";
          shell = pkgs.fish;
        };
      };
      networking = {
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
      };
      services = {
        dnscypt-proxy2 = import ../../modules/nixos/dnscrypt-proxy2.nix;
      };
      nix = import ../../modules/common/nix-settings.nix {inherit inputs;};
      programs.fish.enable = true;
      systemd.services.dnscrypt-proxy2.serviceConfig = {
        StateDirectory = "dnscrypt-proxy";
      };
    })
    # ./boot.nix
    # ./cli.nix
    ../../hosts/port
    ./configuration.nix
    ./desktop.nix
    ./display-manager.nix
    ./environment-variables.nix
    ./gui.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./home.nix
    ./hyprland.nix
    ./locale.nix
    ./lsp.nix
    ./networking.nix
    ./programs.nix
    ./programming-languages.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./ssh.nix
    ./wayland.nix
  ];
}
