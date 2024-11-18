{ inputs, pkgs, config, ... }:

{
  programs.light.enable = true;
  hardware = {
    bluetooth.enable = false;
    wirelessRegulatoryDatabase = true;
    cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
    keyboard.qmk.enable = true;
    graphics = {
      enable32Bit = true;
      enable = true;
      extraPackages = with pkgs; [
        amdvlk
        fw-ectool
        framework-tool
        libva
        libvdpau
        libvdpau-va-gl
        vaapiVdpau
      ];
      extraPackages32 = [
        pkgs.driversi686Linux.amdvlk
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    # Screen
    wlsunset
    brightnessctl

    # Keyboard
    qmk-udev-rules

    # Mobo/kernel
    linuxKernel.packages.linux_zen.framework-laptop-kmod
    linux-firmware
    inputs.fw-fanctrl.nixosModules.default

    # Audio
    alsa-lib
    alsa-utils
    flac
    pulsemixer
  ];
  services = {
    fstrim.enable = true;
    fprintd = {
      enable = true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix-550a;
    };
  };
  powerManagement.powertop.enable = false;
  services.power-profiles-daemon.enable = true;
  boot.extraModprobeConfig = ''
    blacklist noveau
    options noveau modeset=0
  '';
  services.udev.extraRules = ''
      # Remove NVIDIA USB xHCI Host Controller devices, if present
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
      # Remove NVIDIA USB Type-C UCSI devices, if present
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
      # Remove NVIDIA Audio devices, if present
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
      # Remove NVIDIA VGA/3D controller devices
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
  '';
  boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
  zramSwap.enable = true;
  services.colord.enable = true;
  # programs.fw-fanctrl = {
  #   "mine" = {
  #     fanSpeedUpdateFrequency = 5;
  #     movingAverageInterval = 30;
  #     speedCurve = [
  #       { temp = 0; speed = 0; }
  #       { temp = 35; speed = 0; }
  #       { temp = 40; speed = 20; }
  #       { temp = 50; speed = 40; }
  #       { temp = 80; speed = 80; }
  #       { temp = 90; speed = 100; }
  #     ];
  #   };
  # };
}
