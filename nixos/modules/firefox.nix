{ pkgs, ... }:
{
  programs.firefox.enable = true;
  programs.firefox.package = pkgs.firefox;
  programs.firefox.nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
}
