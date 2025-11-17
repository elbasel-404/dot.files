# /etc/nixos/configuration.nix
{ ... }:
{
  imports = [
    <nixos-hardware/lenovo/ideapad/15alc6>
    <nixos-hardware/lenovo/ideapad/slim-5>
    ./hardware-configuration.nix
    # ./modules/snap.nix
    # ./modules/nix-ld.nix
    #./flakes/hyprspace/module.nix
    ./modules/firefox.nix
    ./modules/gnome.nix
    ./modules/plasma.nix
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
