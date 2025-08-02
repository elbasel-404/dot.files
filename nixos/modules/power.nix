{
  # This option configures the system's response to lid closure events.
  # Setting it to "ignore" means that closing the laptop lid will not trigger any action (e.g., suspend, hibernate, or shutdown).
  # This is useful if you want to keep the system running with the lid closed, for example, when connected to an external monitor.
  # services.logind.lidSwitch = "ignore";

  # This option enables the UPower service.
  # UPower is a daemon that provides an interface to enumerate power sources on the system,
  # listen to power events, and query history and statistics.
  # It's commonly used by desktop environments to display battery status and manage power settings.
  # services.upower.enable = true;
  powerManagement.powertop.enable = true;

  # auto-cpufreq is a tool that automatically optimizes CPU speed and power consumption.
  # It monitors CPU usage, temperature, and battery state to adjust CPU frequency and governor settings dynamically.
  # This can help improve battery life without sacrificing performance.
  # services.auto-cpufreq.enable = true;
  # services.thermald.enable = true;
}
