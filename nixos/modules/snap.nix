# ! DISABLED in ../configuration.nix
{ ... }:
{
  imports = [ (import <nix-snapd>).nixosModules.default ];

  services.snap.enable = true;
}
