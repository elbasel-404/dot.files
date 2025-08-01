# /etc/nixos/configuration.nix
#
{ ... }:
{
  imports = [
    # ./modules/disabled.nix
    ./hardware-configuration.nix
    ./modules/env.nix
    ./modules/qt.nix
    ./modules/nix.nix
    ./modules/nixPkgs.nix
    ./modules/system.nix
    ./modules/boot.nix
    ./modules/console.nix
    ./modules/environment.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/power.nix
    ./modules/programs.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/time.nix
    ./modules/users.nix
    ./modules/virtualization.nix
    ./modules/xdg.nix
    ./modules/zram.nix
    ./modules/systemd.nix
  ];

}
