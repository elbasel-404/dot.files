# environment.nix

Defines environment variables and global system settings. Used to set up the shell environment, locale, and other system-wide environment options.

## Options Explained

- `environment.sessionVariables.NIXOS_OZONE_WL = "1";`
  - Sets the NIXOS_OZONE_WL environment variable for Wayland compatibility.
- `environment.systemPackages = with pkgs; [ ... ];`
  - Installs a list of system packages, including AI tools, Neovim utilities, Hyprland tools, networking utilities, and more.
