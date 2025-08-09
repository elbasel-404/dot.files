{ pkgs, ... }:
{
  # Specifies the font packages to be installed and made available to applications.
  # Fonts listed here are managed by Fontconfig, making them accessible system-wide.
  # fonts.fontconfig.enable = true;
  # fonts.fontconfig.antialias = true;
  # fonts.fontconfig.hinting.enable = true;
  # fonts.fontconfig.hinting.style = "slight";
  # fonts.fontconfig.subpixel.rgba = "rgb";

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    # pkgs.font-awesome
  ];
}
