{ pkgs, config, ... }:

{
  programs.light.enable = true;
  hardware = {
    wirelessRegulatoryDatabase = true;
    cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
    keyboard.qmk.enable = true;
    graphics = {
      enable32Bit = true;
      enable = true;
      extraPackages = with pkgs; [
        amdvlk
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
    wlsunset
    brightnessctl
    qmk-udev-rules
    linuxKernel.packages.linux_zen.framework-laptop-kmod
    linux-firmware
    alsa-lib
    alsa-utils
    flac
    pulsemixer
    brightnessctl
  ];
  services.fstrim.enable = true;
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
}
