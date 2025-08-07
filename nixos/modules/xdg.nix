{ pkgs, ... }:
{
  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [
    # pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gnome
    pkgs.xdg-desktop-portal
  ];
}
