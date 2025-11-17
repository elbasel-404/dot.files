{
  description = "Hyprspace flake wrapper to make Hyprspace packages available to the system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      Hyprspace,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      packages.${system}.Hyprspace = Hyprspace.packages.${system}.Hyprspace;
    };
}
