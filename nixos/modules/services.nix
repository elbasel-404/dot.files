# { pkgs, ... }:
{
  # services.ollama.enable = true;
  # services.ollama.acceleration = false;
  services.timesyncd.enable = true;
  services.libinput.enable = true;
  services.xserver.enable = true;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.xserver.displayManager.lightdm.enable = false;
  services.blueman.enable = true;
  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm-password.enableGnomeKeyring = true;
  services.xserver.xkb.layout = "us,ara";
  services.xserver.xkb.options = "grp:alt_shift_toggle";
  services.tlp.enable = true;
  services.thermald.enable = true;
  # services.gvfs.enable = true;
  # services.power-profiles-daemon.enable = true;
}
