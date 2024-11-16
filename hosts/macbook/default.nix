{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../../modules/rust.nix
    ../../modules/homebrew.nix
    ../../modules/secrets.nix
    ../../modules/lsp.nix
    ../../modules/devtools.nix
    ../../modules/cli-tools.nix
    ../../modules/programming-languages.nix
    ../../modules/skhd.nix
    ../../modules/yabai.nix
    ../../modules/jankyborders.nix
    ../../modules/sketchybar.nix
    ../../modules/fonts.nix
    ../../modules/macos.nix
    ../../modules/nix.nix
    ../../modules/common/programs.nix
    ../../modules/common/environment.nix
    ../../modules/darwin/system-configuration.nix
    ../../modules/darwin/nixpkgs.nix
  ];
  networking = {
    computerName = "Bryce's MacBook Pro";
    hostName = "macbook";
    knownNetworkServices = ["Wi-Fi"];
  };
  security.pam.enableSudoTouchIdAuth = true;
  services.nix-daemon.enable = true;
  users.users.bryce = {
    name = "bryce";
    home = "/Users/bryce";
    shell = pkgs.fish;
  };
}
