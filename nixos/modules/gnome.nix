{ pkgs, ... }:
{
  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = true;
  services.gnome.games.enable = false;
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.mutter]
    experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling', 'variable-refresh-rate']
  '';
  services.xserver.displayManager.startx.enable = true;
}
