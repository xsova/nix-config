{pkgs, ...}: {
  rtkit.enable = true;
  polkit.enable = true;
  tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };
  sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };
}
