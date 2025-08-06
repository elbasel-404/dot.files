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
  services.power-profiles-daemon.enable = false;
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.deviceSection = ''
    Option "TearFree" "true"
  '';

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      energy_performance_preference = "power";
      turbo = "never";
      platform_profile = "battery";
      enable_thresholds = "true";
      start_threshold = "20";
      stop_threshold = "80";
      ideapad_laptop_conservation_mode = "true";
    };

    charger = {
      governor = "performance";
      energy_performance_preference = "balance_performance";
      turbo = "auto";
      platform_profile = "performance";
    };

    general = {
      poll_interval = 4;
      sleep_poll_interval = 2;
    };
  };
  # services.tlp.enable = true;
  # services.tlp.settings = {
  #   CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #   CPU_SCALING_GOVERNOR_ON_AC = "performance";
  # };
  # services.gvfs.enable = true;
  services.envfs.enable = true;
}
