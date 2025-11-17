# nix.nix

Configures the Nix package manager and its features.

## Options Explained

- `nix.settings.experimental-features = [ "nix-command" "flakes" ];`
  - Enables experimental features: the new Nix command and flakes support for reproducible builds.
- `nix.settings.auto-optimise-store = true;`
  - Automatically optimizes the Nix store to save disk space by deduplicating files.
