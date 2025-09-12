{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nftables.enable = true;
  networking.firewall.trustedInterfaces = [
    "incusbr0"
    "virbr0"
  ];
}
