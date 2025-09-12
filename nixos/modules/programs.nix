{ pkgs, ... }:
{
  # ! hyprland
  programs.hyprland.enable = true;
  # programs.hyprland.xwayland.enable = false;
  programs.hyprland.withUWSM = true;
  # programs.hyprlock.enable = true;

  # ! zsh
  programs.zsh.enable = true;
  programs.zsh.enableLsColors = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.plugins = [
    "git"
    "z"
    # "you-should-use"
  ];


  #programs.waybar.enable = false;
  #programs.gnupg.agent.enable = false;
  #programs.gnupg.agent.enableSSHSupport = false;

  # programs.dconf.profiles.user.databases = [
  #   {
  #     settings."org/gnome/desktop/interface" = {
  #       gtk-theme = "Adwaita";
  #       icon-theme = "Flat-Remix-Red-Dark";
  #       font-name = "Noto Sans Medium 11";
  #       document-font-name = "Noto Sans Medium 11";
  #       monospace-font-name = "Noto Sans Mono Medium 11";
  #     };
  #   }
  # ];

  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  #   stdenv.cc.cc # C/C++ runtime libs
  #   zlib
  #   openssl
  #   # add more if needed (runs `nix-locate` on missing libs)
  # ];

  # programs.uwsm.enable = true;
  # programs.uwsm.waylandCompositors.hyprland.prettyName = "Hyprland";
  # programs.uwsm.waylandCompositors.hyprland.comment = "Hyprland compositor managed by UWSM";
  # programs.uwsm.waylandCompositors.hyprland.binPath = "/run/current-system/sw/bin/Hyprland";
  # programs.uwsm.waylandCompositors.hyprland.binPath = "${pkgs.hyprland}/bin/Hyprland";


  # programs.direnv.enable = true;
  # programs.direnv.silent = false;
  # programs.direnv.loadInNixShell = true;
  # programs.direnv.nix-direnv.enable = true;
  # programs.direnv.enableZshIntegration = true;

  # programs.zoxide.enable = true;
  # programs.zoxide.enableZshIntegration = true;
  # programs.zoxide.flags = [
  # "--cmd cd"
  # ];

  # programs.dconf.enable = true;
}
