{
  blacklistedKernelModules = [
    "noveau"
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
  ];
  extraModprobeConfig = ''
    blacklist noveau
    options noveau modeset=0
  '';
  loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}
