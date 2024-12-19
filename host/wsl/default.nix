{ pkgs, inputs, ... }:

let 
  hostname = "wsl"; # FIXME: Add hostname
  username = "bryce"; # FIXME: Add username
in {

  # Import module/files to add them to your system.
  imports = [
    ../../modules/cli-tools.nix # Random CLI packages
    ../../modules/lsp.nix # Language servers
    ../../modules/fish.nix
    ../../modules/gui.nix # Random GUI packages/apps
  ];

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
      "wheel" # Gives `sudo` privalege
    ];
  };

  system.stateVersion = "24.05"; # DO NOT CHANGE

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    defaultUser = username;
    startMenuLaunchers = true;
    docker-desktop.enable = false; # Enable if you don't want to run docker in wsl
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  systemd.user = { # Should make VSCode _just work_ in wsl
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
