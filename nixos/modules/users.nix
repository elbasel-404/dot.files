{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  users.users.elbasel = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
      "incus-admin"
      "docker"
      "libvirtd"
    ];
  };
}
