# virtualization.nix

Sets up virtualization options, such as enabling KVM, QEMU, VirtualBox, or other virtualization technologies.

## Options Explained

- `virtualisation.docker.enable = true;`
  - Enables Docker support on the system, allowing you to run containerized applications.
- `virtualisation.docker.rootless.enable = true;`
  - (Commented) Enables Docker in rootless mode, allowing non-root users to run Docker containers.
- `virtualisation.docker.rootless.setSocketVariable = true;`
  - (Commented) Sets the Docker socket environment variable for rootless Docker sessions.
- `virtualisation.incus.enable = true;`
  - Enables Incus, a container and virtual machine manager (LXD fork), for managing containers and VMs.
- `virtualisation.libvirtd.enable = false;`
  - (Commented) Would enable libvirtd, the virtualization daemon for managing KVM/QEMU and other hypervisors.
- `virtualisation.waydroid.enable = false;`
  - (Commented) Would enable Waydroid, allowing you to run Android in a container on Linux.

Uncomment options as needed to enable/disable specific virtualization features.
