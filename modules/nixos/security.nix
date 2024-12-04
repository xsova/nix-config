{pkgs, ...}: {
  rtkit.enable = true;
  tpm2 = {
    enable = true;
    # pkcs1.enable = true;
    tctiEnvironment.enable = true;
  };
  apparmor = {
    enable = true;
    packages = with pkgs; [
      apparmor-utils
      apparmar-profiles
    ];
  };
  polkit.enable = true;
}
