{ pkgs, ... }:
{
  imports = [
    ./home-manager.nix
    ./locale.nix
  ];
  environment.systemPackages = with pkgs; [
    nix-output-monitor
    ollama
    (inputs.pinix.packages.${pkgs.stdenv.hostPlatform.system}.pinix)
    psmisc
    psi-notify
    playerctl
    (inputs.fh.packages.x86_64-linux.default)
  ];
  programs = {
    fish.enable = true;
    starship.enable = true;
  };
}
