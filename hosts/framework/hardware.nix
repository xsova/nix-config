{ pkgs, config, ... }:

{
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
  environment.systemPackages = [
    pkgs.qmk-udev-rules
    pkgs.linuxKernel.packages.linux_zen.framework-laptop-kmod
  ];
  services.fstrim.enable = true;
  powerManagement.powertop.enable = true;
}
