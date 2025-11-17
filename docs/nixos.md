# NixOS Setup Documentation

This document provides an overview of the current NixOS setup as found in the `/nixos` directory of this configuration repository.

## Directory Structure

- **configuration.nix**: Main NixOS configuration file, imports modules and sets system-wide options.
- **hardware-configuration.nix**: Auto-generated hardware configuration, includes disk, filesystem, and device settings.
- **aggregate.sh**: Helper script for aggregating or managing NixOS configurations.
- **monolith.nix**: Monolithic configuration, may combine multiple modules for a single system.
- **modules/**: Contains modular configuration files for different aspects of the system:
  - `boot.nix`: Bootloader and kernel settings
  - `console.nix`: Console and TTY configuration
  - `disabled.nix`: Disabled services or features
  - `environment.nix`: Environment variables and global settings
  - `firefox.nix`: Firefox browser configuration
  - `firewall.nix`: Firewall rules and settings
  - `fonts.nix`: Font configuration
  - `gnome.nix`: GNOME desktop environment settings
  - `hardware.nix`: Additional hardware-specific configuration
  - `locale.nix`: Locale and language settings
  - `networking.nix`: Network configuration
  - `nix-ld.nix`: Nix-ld loader settings
  - `nix.nix`: Nix package manager settings
  - `nixPkgs.nix`: Nixpkgs channel and package settings
  - `plasma.nix`: KDE Plasma desktop environment settings
  - `programs.nix`: User programs and applications
  - `qt.nix`: Qt framework settings
  - `security.nix`: Security-related configuration
  - `services.nix`: System services configuration
  - `snap.nix`: Snap package manager settings
  - `system.nix`: System-wide options
  - `systemd.nix`: Systemd service configuration
  - `time.nix`: Time and timezone settings
  - `users.nix`: User accounts and permissions
  - `virtualization.nix`: Virtualization settings
  - `xdg.nix`: XDG base directory specification
  - `zram.nix`: ZRAM swap configuration

## How It Works

- The main `configuration.nix` imports modules from the `modules/` directory to keep the setup modular and maintainable.
- Hardware-specific settings are kept in `hardware-configuration.nix`.
- Scripts like `aggregate.sh` help automate or aggregate configuration tasks.
- Desktop environments (GNOME, Plasma) and other features are enabled/disabled via their respective module files.

## Customization

To customize your setup:

- Edit or add modules in `modules/` for new features or changes.
- Update `configuration.nix` to import new modules.
- Use `monolith.nix` for a single-file configuration if preferred.

## Applying Changes

After editing configuration files, rebuild your system with:

```sh
sudo nixos-rebuild switch
```

## Additional Notes

- Modular approach makes it easy to maintain and extend.
- Each module is focused on a specific aspect of the system.
- Scripts and monolithic configs are available for advanced use cases.

---

For more details, see the comments in each module file in `/nixos/modules/`.
