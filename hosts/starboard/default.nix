{
  inputs,
  self,
  ...
}:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {inherit inputs;};
  modules = [
    inputs.hardware.nixosModules.framework-13-7040-amd
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index.nixosModules.nix-index
    inputs.lix.nixosModules.default
    {system.configurationRevision = self.rev or self.dirtyRev or null;}
    ./boot.nix
    ./cli.nix
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
