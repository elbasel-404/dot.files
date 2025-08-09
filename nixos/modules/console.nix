{ pkgs, ... }:
{
  # Specifies a list of packages that provide console fonts, keymaps, and other resources for virtual consoles.
  console.packages = [ pkgs.terminus_font ];

  # If set to true, the virtual console keymap will be configured based on the X server keyboard settings.
  # This allows for a consistent keyboard layout between the graphical environment and virtual consoles.
  # console.useXkbConfig = true;

  # If set to true, console setup (font, keymap) is performed early in the boot process.
  # This ensures the console is configured before most services start.
  console.earlySetup = true;

  # Sets the default font for virtual consoles.
  # This can be a font name (if provided by a package in console.packages) or a path to a PSF font file.
  # The example uses a specific Terminus font file.
  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
}
