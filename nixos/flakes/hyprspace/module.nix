{ lib, ... }:
let
  # Resolve to the local flake path so we can use builtins.getFlake in a
  # non-flake `nixos-rebuild` workflow. This mirrors the pattern used for
  # `astal`.
  hyprspaceDir = builtins.toString ./.;
  hyprspace =
    if builtins.pathExists hyprspaceDir then builtins.getFlake ("path:" + hyprspaceDir) else null;
  system = builtins.currentSystem;
in
{
  # Add Hyprspace packages/plugins only when the local hyprspace flake exists.
  # This mirrors the `astal` module pattern.
  config = lib.mkIf (hyprspace != null) {
    environment.systemPackages = [ hyprspace.packages.${system}.Hyprspace ];

    # Hyprland plugin registration is sometimes provided by other modules
    # or the top-level flake. We avoid touching `wayland.windowManager.*` here
    # because it may not be defined at module-evaluation time, which causes
    # a module error like "The option `wayland' does not exist." If you want
    # Hyprspace to be loaded as a Hyprland plugin automatically, use the
    # top-level flake (it adds the plugin) or set the option manually in
    # `configuration.nix` when the `wayland` options are available.
  };
}
