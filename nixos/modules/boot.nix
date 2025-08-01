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
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"

  ];
  # Kernel modules to be loaded automatically after the system has booted.
  # "cgroup_cpuset" is a module related to cgroup cpuset functionality.

  boot.kernelModules = [
    "kvm-intel"
    "cgroup_cpuset"
  ];
  boot.extraModulePackages = [ ];

  # Custom parameters to be added to the kernel command line.
  # These can control various kernel behaviors or enable specific features.
  # "cgroup_enable=cpuset" enables the cpuset cgroup functionality.
  boot.kernelParams = [ "cgroup_enable=cpuset" ];

  # Specifies the kernel package to use.
  # pkgs.linuxPackages_zen refers to a kernel optimized for desktop performance.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
