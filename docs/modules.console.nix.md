# console.nix

Configures console and TTY settings, including font, keymap, and display options for virtual terminals.

## Options Explained

- `console.packages = [ pkgs.terminus_font ];`
  - Installs the Terminus font for the console.
- `console.earlySetup = true;`
  - Enables early setup of the console during boot.
- `console.font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";`
  - Sets the console font to Terminus 132n.
- `console.useXkbConfig = true;`
  - (Commented) Configures the console keymap based on X server keyboard settings for consistency.
