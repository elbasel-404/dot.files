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
  services.hypridle.enable = true;
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  services.power-profiles-daemon.enable = false;
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.deviceSection = ''
    Option "TearFree" "true"
  '';

  # services.tlp.enable = true;
  # services.tlp.settings = {
  #   CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #   CPU_SCALING_GOVERNOR_ON_AC = "performance";
  # };
  # services.gvfs.enable = true;
  # services.power-profiles-daemon.enable = true;
}
