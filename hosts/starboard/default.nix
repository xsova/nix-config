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
    headless = false;
  in
    [
      ({
        inputs,
        pkgs,
        config,
        lib,
        ...
      }: {
        system = import ../../modules/nixos/system.nix {inherit self;};
        time = import ../../modules/nixos/time.nix;
        boot = import ../../modules/nixos/boot.nix;
        environment = import ../../modules/common/environment.nix {inherit headless host pkgs inputs;};
        nixpkgs = let platform = "x86_64-linux"; in import ../../modules/common/nixpkgs.nix {inherit platform self;};
        users.users = import ../../modules/nixos/user.nix {inherit user pkgs;};
        networking = import ../../modules/nixos/networking.nix {inherit host;};
        zramSwap.enable = true;
        services = {
          clamav.daemon.enable = true;
          fail2ban.enable = true;
          fstrim.enable = true;
          fwupd = {
            enable = true;
            extraRemotes = ["lvfs-testing"];
          };
          # hypridle = {
          #   enable = true;
          #   settings = {
          #     general = {
          #       after_sleep_cmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
          #       before_sleep_cmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off && ${pkgs.systemd}/bin/loginctl lock-session";
          #       ignore_dbus_inhibit = false;
          #       lock_cmd = "${pkgs.procps}/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
          #     };
          #     listener = [
          #       {
          #         timeout = 180;
          #         on-timeout = "${pkgs.brillo}/bin/brillo -O; ${pkgs.brillo}/bin/brillo -u 1000000 -S 10";
          #         on-resume = "${pkgs.brillo}/bin/brillo -I -u 500000";
          #       }
          #       {
          #         timeout = 300;
          #         on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
          #       }
          #       {
          #         timeout = 360;
          #         on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
          #       }
          #     ];
          #   };
          # };
          libinput.enable = true;
          ollama.enable = true;
          power-profiles-daemon.enable = true;
          tumbler.enable = true;
          colord.enable = true;
          dbus = import ../../modules/nixos/dbus.nix;
          dnscrypt-proxy2 = import ../../modules/nixos/dnscrypt-proxy2.nix;
          fprintd = import ../../modules/nixos/fprintd.nix {inherit pkgs;};
          greetd = import ../../modules/nixos/display-manager.nix {inherit pkgs;};
          keyd = import ../../modules/nixos/keyd.nix;
          openssh = import ../../modules/nixos/openssh.nix;
          pipewire = import ../../modules/nixos/pipewire.nix;
          udev = import ../../modules/nixos/udev.nix;
          xserver = import ../../modules/nixos/xserver.nix;
          tlp.enable = false;
          logind.lidSwitch = "suspend-then-hibernate";
        };
        powerManagement = {
          cpuFreqGovernor = lib.mkDefault "powersave";
          powertop.enable = true;
        };
        console.useXkbConfig = true;
        security = import ../../modules/nixos/security.nix {inherit pkgs;};
        nix = import ../../modules/common/nix-settings.nix {inherit inputs;};
        programs = {
          fish.enable = true;
          light.enable = true;
          dconf.enable = true;
          thunar.enable = true;
          hyprland = import ../../modules/nixos/hyprland.nix {inherit inputs pkgs;};
          # wlogout.enable = true;
          # hyprlock = {
          #   enable = true;
          #   settings = {
          #     background = [
          #       {
          #         path = "screenshot";
          #         blur_passes = 3;
          #         blur_size = 3;
          #         noise = 0.0117;
          #         contrast = 0.8916;
          #         brightness = 0.8172;
          #         vibrancy = 0.1696;
          #         vibrancy_darkness = 0.0;
          #       }
          #     ];
          #     input-field = [
          #       {
          #         placeholder_text = "";
          #       }
          #     ];
          #     label = [
          #       {
          #         text_align = "right";
          #         halign = "center";
          #         valign = "center";
          #         text = "Hello, $USER";
          #         font_size = 50;
          #         font_family = "MD IO Trial";
          #         position = "0, 80";
          #       }
          #       {
          #         text_align = "right";
          #         halign = "center";
          #         valign = "center";
          #         text = "$TIME";
          #         font_size = 150;
          #         font_family = "MD IO Trial";
          #         position = "0, 300";
          #       }
          #     ];
          #   };
          # };
        };
        hardware = import ../../modules/nixos/framework-hardware.nix {inherit pkgs config;};
        systemd = {
          packages = [pkgs.auto-cpufreq];
          services.dnscrypt-proxy2.serviceConfig.StateDirectory = "dnscrypt-proxy";
          sleep.extraConfig = ''
            HibernateDelaySec=24h
          '';
        };
        i18n = import ../../modules/nixos/locale.nix;
        home-manager = {
          useGlobalPkgs = true;
          backupFileExtension = "bak";
          users = {
            ${user} = import ../../modules/home/users/user.nix {inherit inputs pkgs user host lib;};
          };
        };
      })
    ]
    ++ [
      inputs.hardware.nixosModules.framework-13-7040-amd
      inputs.home-manager.nixosModules.home-manager
      inputs.nix-index.nixosModules.nix-index
      inputs.lix.nixosModules.default
      ./hardware-configuration.nix # This is automatically generated by nixos.
    ];
}
