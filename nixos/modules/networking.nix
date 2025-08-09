{
  # Enables NetworkManager, a service that provides automatic network connection management.
  networking.hostName = "nixos";
  # It simplifies network configuration for wired, wireless, and mobile broadband connections.
  networking.networkmanager.enable = true;

  # Enables nftables, a modern Linux kernel packet classification framework.
  # It is the successor to iptables and provides more efficient and flexible firewalling capabilities.
  # networking.nftables.enable = true;

  # Defines a list of network interfaces that are considered trusted by the firewall.
  # Traffic on these interfaces will bypass firewall restrictions.
  # "incusbr0" and "virbr0" are typically bridge interfaces used by virtualization technologies (Incus/LXD and KVM/libvirt respectively).
  networking.firewall.trustedInterfaces = [
    "incusbr0"
    "virbr0"
  ];
}
