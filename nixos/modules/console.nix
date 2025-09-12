{ pkgs, ... }:
{
  console.packages = [ pkgs.terminus_font ];
  console.earlySetup = true;
  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";

  # If set to true, the virtual console keymap will be configured based on the X server keyboard settings.
  # This allows for a consistent keyboard layout between the graphical environment and virtual consoles.
  # console.useXkbConfig = true;
}
