{
  # Enables experimental Nix features.
  # - "nix-command": Enables the new `nix` command-line interface. This is a more user-friendly and feature-rich alternative to the older `nix-env`, `nix-build`, etc. commands.
  # - "flakes": Enables Nix Flakes, a new way to manage Nix expressions and their dependencies. Flakes improve reproducibility and composability of Nix projects.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true; # Automatically optimize the Nix store to save space
}
