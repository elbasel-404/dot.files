# disabled.nix

Lists services or features that are explicitly disabled in the system configuration.

## Options Explained

- `services.xserver.enable = true;`
  - (Commented) Enables the X server for graphical sessions.
- `services.displayManager.sddm.enable = true;`
  - (Commented) Enables the SDDM display manager.
- `services.desktopManager.plasma6.enable = true;`
  - (Commented) Enables the Plasma 6 desktop environment.
- `services.greetd.enable = true;`
  - (Commented) Enables the Greetd login manager.
- `services.greetd.vt = 3;`
  - (Commented) Sets the virtual terminal for Greetd.
- `programs.regreet.enable = true;`
  - (Commented) Enables Regreet, a greeter for Greetd.
- `security.pam.services.hyprland.enableGnomeKeyring = true;`
  - (Commented) Enables GNOME Keyring for Hyprland PAM service.
- `services.gnome.gnome-keyring.enable = true;`
  - (Commented) Enables GNOME Keyring service.
- `services.qemuGuest.enable = true;`
  - (Commented) Enables QEMU guest agent.
- `services.spice-vdagentd.enable = true;`
  - (Commented) Enables Spice agent for virtual desktops.
- `swapDevices.device = "/swapfile";`
  - (Commented) Sets the swap device file.
- `swapDevices.size = "4G";`
  - (Commented) Sets the swap device size.
- `swapDevices.priority = -1;`
  - (Commented) Sets the swap device priority.
- `environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";`
  - (Commented) Sets the Qt platform theme environment variable.
- `sound.enable = true;`
  - (Commented) Enables sound support.
- `hardware.pulseaudio.enable = true;`
  - (Commented) Enables PulseAudio sound server.
- `security.rtkit.enable = true;`
  - (Commented) Enables RealtimeKit for real-time scheduling.
- `services.blueman.enable = true;`
  - (Commented) Enables Blueman Bluetooth manager.
