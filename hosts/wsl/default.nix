{ pkgs, inputs, ... }:

let 
  hostname = ""; # FIXME: Add hostname
  username = ""; # FIXME: Add username
in {
  time.timeZone = "America/Los_Angeles";

  networking.hostName = "${hostname}";

  programs.fish.enable = true;
  environment.pathsToLink = ["/share/fish"];
  environment.shells = [pkgs.fish];

  environment.enableAllTerminfo = true;

  security.sudo.wheelNeedsPassword = false;

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
    ];
  };

  system.stateVersion = "24.05";

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    defaultUser = username;
    startMenuLaunchers = true;

    docker-desktop.enable = false;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  # FIXME: uncomment the next block to make vscode running in Windows "just work" with NixOS on WSL
  # solution adapted from: https://github.com/K900/vscode-remote-workaround
  # more information: https://github.com/nix-community/NixOS-WSL/issues/238 and https://github.com/nix-community/NixOS-WSL/issues/294
  systemd.user = {
    paths.vscode-remote-workaround = {
      wantedBy = ["default.target"];
      pathConfig.PathChanged = "%h/.vscode-server/bin";
    };
    services.vscode-remote-workaround.script = ''
      for i in ~/.vscode-server/bin/*; do
        if [ -e $i/node ]; then
          echo "Fixing vscode-server in $i..."
          ln -sf ${pkgs.nodejs_18}/bin/node $i/node
        fi
      done
    '';
  };

  nix = {
    settings = {
      trusted-users = [username];
      # FIXME: use your access tokens from secrets.json here to be able to clone private repos on GitHub and GitLab
      # access-tokens = [
      #   "github.com=${secrets.github_token}"
      #   "gitlab.com=OAuth2:${secrets.gitlab_token}"
      # ];

      accept-flake-config = true;
      auto-optimise-store = true;
    };

    registry = {
      nixpkgs = {
        flake = inputs.nixpkgs;
      };
    };

    nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
      "nixos-config=/etc/nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
    extraOptions = ''experimental-features = nix-command flakes'';
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
}
