{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  security.sudo.extraConfig = '' Defaults lecture = never '';
  services.zfs = {
    autoScrub.enable = true;
    autoScrub.pools = [ "zroot" ];
    trim.enable = true;
  };
  boot = {
    initrd = {
      availableKernelModules = [
        "9p"
        "9pnet_virtio"
        "ahci"
        "amdgpu"
        "nvme"
        "pci_stub"
        "sd_mod"
        "thunderbolt"
        "uas"
        "usb_storage"
        "usbhid"
        "vfio"
        "vfio-pci"
        "vfio_iommu_type1"
        "virtio_blk"
        "virtio_mmio"
        "virtio_net"
        "virtio_pci"
        "virtio_scsi"
        "xhci_pci"
      ];
      kernelModules = [
        "amdgpu"
        "vfio"
        "vfio-pci"
      ];
      systemd = {
        enable = lib.mkDefault true;
        services.rollback = {
          description = "Rollback root filesystem to a pristine state on boot";
          wantedBy = [ "initrd.target" ];
          after = [ "zfs-import-zroot.service" ]; # FIXME change zroot to the name of specific zpool in disko-config
          before = [ "sysroot.mount" ];
          path = with pkgs; [ zfs ];
          unitConfig.defaultDependencies = "no";
          serviceConfig.type = "oneshot";
          script = '' zfs rollback -r zroot/encripted/root@blank && echo " >> >> rollback complete << << "'';
        };
      };
    };
    zfs = {
      requestEncryptionCredentials = true;
      allowHibernation = false;
    };
    supportedFileSystems = [ "zfs" ];
    kernelModules = [
      "kvm-amd"
      "pci-stub"
      "vfio"
      "vfio_iommu_type1"
      "kvmfr"
    ];
    kernelParams = [
      "amd_iommu=on"
      "mem_sleep_default=deep"
    # "iommu=pt" # Required if doing passthrough to VMs / Docker
    ];
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    extraModulePackages = [];
    extraModprobeConfig = ''
      options cfg80211 ieee802111_regdom="US"
    '';
  };
  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = {
    system = "x86_64-linux";
  };
  hardware = {
    wirelessRegulatoryDatabase = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
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
}

