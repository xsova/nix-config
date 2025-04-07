{
  inputs,
  self,
  ...
}:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit inputs; };
  modules = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index.nixosModules.nix-index
    inputs.lix.nixosModules.default
    {
      system.configurationRevision = self.rev or self.dirtyRev or null;
      nixpkgs.hostPlatform.system = "x86_64-linux";
    }
    ../../modules/nixos/cli
    ../../modules/nixos/gui
    ../../modules/nixos/system/boot.nix
    ../../modules/nixos/system/configuration.nix
    ../../modules/nixos/system/users.nix
    ../../modules/nixos/system/desktop.nix
    ../../modules/common
  ];
}
