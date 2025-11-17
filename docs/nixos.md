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

````sh
sudo nixos-rebuild switch

If you use flakes, you can apply the local `flake.nix` with:

```sh
sudo nixos-rebuild switch --flake .#nixos

If you have a local flake providing a package — for example the `astal` flake
in `nixos/flakes/astal` — you can build that package directly from this
repository without reloading the system using:

```sh
nix build .#astal.packages.x86_64-linux.default
````

To add `astal` to the system packages via the top-level flake, ensure the top
and a small module such as:

```nix
({ pkgs, ... }: {
  environment.systemPackages = [ astal.packages.x86_64-linux.default ];
})
```

Then apply with `sudo nixos-rebuild switch --flake .#nixos`.

The top-level `flake.nix` also exposes Hyprland/Hyprspace as inputs. If you
want Hyprspace enabled as a Hyprland plugin, the flake already adds the
plugin to `wayland.windowManager.hyprland.plugins`. To use the plugin in a
non-flake workflow you can fetch the Hyprspace package directly with:

````sh
nix build .#Hyprspace.packages.x86_64-linux.Hyprspace

Alternatively, a local Hyprspace flake and module are included to make this
available from `configuration.nix` without using `--flake`. The module is
`./modules/hyprspace.nix` and the wrapper flake is in
`./flakes/hyprspace/flake.nix`. To enable it, add `./modules/hyprspace.nix`
to your imports in `configuration.nix` and rebuild the system:

```sh
sudo nixos-rebuild switch
````

If the local flake is present, the module will pull `Hyprspace` via
`builtins.getFlake` and add `Hyprspace` to `environment.systemPackages` and
`wayland.windowManager.hyprland.plugins`.

````

If instead you'd prefer to import a flake-provided package directly into
`configuration.nix` (no `--flake` flag) we supply a small module that pulls
the `astal` flake and makes its package available system-wide. The module is
`./modules/astal.nix`; to install its package run:

```sh
sudo nixos-rebuild switch
````

```

```

## Additional Notes

- Modular approach makes it easy to maintain and extend.
- Each module is focused on a specific aspect of the system.
- Scripts and monolithic configs are available for advanced use cases.

---

For more details, see the comments in each module file in `/nixos/modules/`.
