{ pkgs, ... }:
{
  # Allows NixOS to modify EFI variables in the system's firmware.
  # Enabling this is convenient for automatic boot entry updates,
  # but can sometimes cause issues with buggy firmware.
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.enable = true;


  boot.tmp.cleanOnBoot = true;

  # Kernel modules to be included in the initrd.
  # These modules are loaded early in the boot process, before the root filesystem is mounted.
  # "i915" is for Intel graphics.
  boot.initrd.kernelModules = [
    "i915"
    # "xhci_pci"
    # "nvme"
    # "usb_storage"
    # "sd_mod"
    # "sdhci_pci"
  ];
  # Kernel modules to be loaded automatically after the system has booted.
  # "cgroup_cpuset" is a module related to cgroup cpuset functionality.

  # boot.kernelModules = [
  #   "kvm-intel"
  #   "cgroup_cpuset"
  #   "intel_tcc_cooling"
  #   "intel_lpss_pci"
  #   "i2c_hid_acpi"
  #   "intel_hid_accel"
  #   "nvme"
  # ];

  #boot.extraModulePackages = [ ];

  # boot.kernelParams = [
  #   "i915.enable_guc=3"
  #   "i915.force_probe=46d1"
  #   "intel_iommu=on,kernel_enable=no"
  #   "cgroup_enable=cpuset"
  #   "mitigations=off" # Only if you prioritize performance over security
  #   # "quiet"
  #   "splash"
  #   "rd.systemd.show_status=false"
  #   "rd.udev.log_level=3"
  # ];

  # Custom parameters to be added to the kernel command line.
  # These can control various kernel behaviors or enable specific features.
  # "cgroup_enable=cpuset" enables the cpuset cgroup functionality.
  # boot.kernelParams = [  ];

  # Specifies the kernel package to use.
  # pkgs.linuxPackages_zen refers to a kernel optimized for desktop performance.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
