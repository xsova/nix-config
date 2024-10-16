{ pkgs, ... }:

{
  services = {
    tlp.enable = true;
    auto-cpufreq.enable = true;
  };

  powerManagement.powertop.enable = true;

  environment.systemPackages = [
    pkgs.qmk-udev-rules
    pkgs.linuxKernel.packages.linux_zen.framework-laptop-kmod
  ];
}
