{ pkgs, ... }:
{
  # systemd.services.flatpak-repo.wantedBy = [ "multi-user.target" ];
  # systemd.services.flatpak-repo.path = [ pkgs.flatpak ];
  # systemd.services.flatpak-repo.script = ''flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo'';
  #systemd.services.flatpak-repo = {
  #  wantedBy = [ "multi-user.target" ];
  #  path = [ pkgs.flatpak ];
  #  script = ''flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo'';
  #};
}
