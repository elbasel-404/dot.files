# security.nix

Configures security-related options, such as authentication, sudo, and system hardening features.

## Options Explained

- `security.polkit.enable = false;`
  - (Commented) Disables PolicyKit, a toolkit for defining and handling authorizations.
- `security.rtkit.enable = false;`
  - (Commented) Disables RealtimeKit, a D-Bus service that helps grant real-time scheduling to user processes.
