{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;
  hardware.graphics.package = pkgs.mesa;
  hardware.graphics.extraPackages = with pkgs; [
    # Provides VA-API hardware acceleration for video encoding/decoding on Intel GPUs.
    # Improves performance and efficiency for video playback and processing.
    intel-media-driver # For VA-API hardware acceleration on Intel
    intel-vaapi-driver
    vpl-gpu-rt # newer hardware
    # vaapiIntel         # Older VA-API driver, intel-media-driver is preferred
    # libvdpau-va-gl     # VDPAU-VA-API backend
  ];
}
