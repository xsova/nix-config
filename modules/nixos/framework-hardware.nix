{
  pkgs,
  config,
  ...
}: {
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
}
