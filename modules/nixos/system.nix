{self, ...}: {
  configurationRevision = self.rev or self.dirtyRev or null;
  stateVersion = "24.05";
}
