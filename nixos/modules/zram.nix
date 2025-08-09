{ lib, ... }:
{
  #zramSwap.enable = false;
  #swapDevices = lib.mkForce [ ];
  # zramSwap.memoryPercent = 50;
  # zramSwap.algorithm = "zstd";
  # zramSwap.priority = 100;
  # zramSwap.writebackDevice = "/dev/nvme0n1p1"; # If you have fast storage
}
