{ pkgs, ... }:

{
  programs = {
    home-manager.enable = true;
    fish.enable = true;
    ripgrep.enable = true;
    htop.enable = true;
    ssh = {
      enable = true;
      package = pkgs.openssh;
    };
  };
  # services.yubikey-agent.enable = true;
}
