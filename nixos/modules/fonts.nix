{ pkgs, ... }:
{
  # Specifies the font packages to be installed and made available to applications.
  # Fonts listed here are managed by Fontconfig, making them accessible system-wide.
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.font-awesome
  ];
}
