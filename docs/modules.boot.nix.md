# boot.nix

Configures bootloader and kernel options, such as GRUB, systemd-boot, and kernel parameters.

## Options Explained

- `boot.loader.efi.canTouchEfiVariables = true;`
  - Allows NixOS to modify EFI variables, required for managing EFI boot entries.
- `boot.kernelPackages = pkgs.linuxPackages_zen;`
  - Sets the kernel package to use the Zen kernel variant for performance.
- `boot.loader.systemd-boot.enable = true;`
  - Enables the systemd-boot bootloader.
- `boot.tmp.cleanOnBoot = true;`
  - Cleans the `/tmp` directory on each boot.
- `boot.initrd.kernelModules = [ "i915" ];`
  - Loads the Intel graphics kernel module early in the boot process.
- `boot.kernelModules = [ ... ];`
  - (Commented) Loads additional kernel modules after boot, e.g., virtualization or hardware support.
- `boot.extraModulePackages = [ ... ];`
  - (Commented) Adds extra kernel module packages.
- `boot.kernelParams = [ ... ];`
  - (Commented) Adds custom parameters to the kernel command line for advanced configuration.
