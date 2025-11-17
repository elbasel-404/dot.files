# users.nix

Manages user accounts, groups, and permissions. Defines system users, their home directories, and access rights.

## Options Explained

- `users.defaultUserShell = pkgs.zsh;`
  - Sets the default shell for users to Zsh.
- `users.users.elbasel = { ... }`
  - Defines the user 'elbasel' as a normal user and assigns extra groups for permissions:
    - `wheel`: Administrative privileges (sudo)
    - `input`: Access to input devices
    - `incus-admin`: Incus container admin group
    - `docker`: Docker group for container management
    - `libvirtd`: Libvirt group for virtualization management
