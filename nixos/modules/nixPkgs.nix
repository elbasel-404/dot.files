{
  # Allows the installation of packages that are not considered "free" software.
  # This is necessary for installing proprietary software or packages with restrictive licenses.
  # It's a global setting, so be mindful of the implications.
  nixpkgs.config.allowUnfree = true;
}
