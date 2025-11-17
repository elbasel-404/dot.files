# ! DISABLED in ../configuration.nix
{ pkgs, ... }:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
    curl
    dbus
    expat
    systemd
    fontconfig
    freetype
    nss
    nspr
    alsa-lib

    # X11 + input
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXfixes
    xorg.libXi
    xorg.libXrender
    xorg.libXtst
    xorg.libXScrnSaver

    # GLib/GTK stack
    glib
    gtk3
    gdk-pixbuf
    pango
    cairo
    atk
  ];
}
