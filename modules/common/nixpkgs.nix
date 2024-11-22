{platform, self, ... }: {
  config.allowUnfree = true;
  hostPlatform = platform;
  buildPlatform = platform;
  flake = {
    setNixPath = true;
    setFlakeRegistry = true;
  };
  overlays = self.overlays;
}
