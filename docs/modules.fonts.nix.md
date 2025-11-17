# fonts.nix

Configures system fonts, including font packages, rendering options, and font settings for desktop environments.

## Options Explained

- `fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];`
  - Installs the JetBrains Mono Nerd Font system-wide.
- `fonts.fontconfig.enable = true;`
  - (Commented) Enables Fontconfig for font management.
- `fonts.fontconfig.antialias = true;`
  - (Commented) Enables font antialiasing for smoother text.
- `fonts.fontconfig.hinting.enable = true;`
  - (Commented) Enables font hinting for improved legibility.
- `fonts.fontconfig.hinting.style = "slight";`
  - (Commented) Sets the hinting style to 'slight'.
- `fonts.fontconfig.subpixel.rgba = "rgb";`
  - (Commented) Sets subpixel rendering order to 'rgb'.
