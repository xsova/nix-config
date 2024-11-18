{
  inputs,
  self,
  ...
}:
inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = {inherit inputs;};
  modules = [
    {system.configurationRevision = self.rev or self.dirtyRev or null;}
    inputs.nix-index.darwinModules.nix-index
    inputs.home-manager.darwinModules.default
    inputs.lix.nixosModules.default
    ({pkgs, ...}: {
      imports = [
        ./home
        ../../modules/common
        ../../modules/darwin
      ];
      networking = {
        computerName = "Bryce's MacBook Pro";
        hostName = "port";
        knownNetworkServices = ["Wi-Fi"];
      };
      security.pam.enableSudoTouchIdAuth = true;
      services.nix-daemon.enable = true;
      users.users.bryce = {
        name = "bryce";
        home = "/Users/bryce";
        shell = pkgs.fish;
      };
    })
  ];
}
