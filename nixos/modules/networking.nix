{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nftables.enable = true;
  networking.interfaces.wlp0s20f3.wakeOnLan.enable = true;
  networking.firewall.trustedInterfaces = [
    "incusbr0"
    "virbr0"
  ];
}
