{ pkgs, ... }:
{

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    # === neovim stuff === 
    prettierd
    eslint_d
    nil
    luarocks
    lua5_1
    tree-sitter
    typescript-language-server
    # ===

    git-filter-repo
    python314
    lazygit
    gcc
    brave
    google-chrome
    chromium
    ranger
    vscode
    terminator
    nodePackages_latest.vercel 
    corepack
    nodejs
    git
    gh
    neovim
    firefox-bin
    mpv
    tree
    unzip
    fzf
    tldr
    eza
    dust
    fd
    ripgrep
    silver-searcher
    zsh-completions
    obs-studio
    wget
    postman
    deluge
    ffmpeg
    jq
    bat
    kitty
    starship
    wofi
    cava
    quickemu # vms
    atuin # shell history
    grimblast # screenshot tool
    brightnessctl # cli brightness control
    playerctl # cli media controller
    btop # resource monitor
    acpi # show battery status
    clipse # clipboard manager for Wayland
    swappy # screenshot editing tool
    nil # language server for nix lang
    wl-clipboard # command-line copy/paste for Wayland
    hyprls # hyprland language server

    # pciutils
    # gsettings-qt 
    # komorebi
    # gnome-software
    # xorg.xcursorthemes
    # gsettings-desktop-schemas 
    # gnome.nixos-gsettings-overrides
    # libreoffice-qt6-fresh 
    # net-tools
    # libnotify
    # pamixer
    # yad
    # quickgui
    # networkmanagerapplet
    # dig
    # ayu-theme-gtk
    # gruvbox-kvantum
    # gtk-engine-murrine
    # gruvbox-gtk-theme
    # gnome-themes-extra
    # gnome-calculator
    # gnome-text-editor
    # pavucontrol
    # walker
    # nwg-look
    # hyprcursor
    # swaynotificationcenter
    # seahorse
    # nautilus
    # xfce.xfce4-icon-theme
    # arc-theme
    # satty
    # hyprshot
    # powertop
    # shfmt
    # shellcheck
    # bash-language-server
    # lxqt.lxqt-policykit
    # hyprshell 
    # fnm
    # nixfmt-rfc-style
    # nodejs_24
    # nodejs-slim_24
    # bun
    # typescript
    # typescript-language-server
    # eslint
    # eslint_d
    # prettierd
    # pipx
    # python313
    # python313Packages.yowsup
    # python311Packages.pip
    # zig
    # openconnect_openssl
    # docker-credential-helpers
    # grim
    # vlc
    # webtorrent_desktop
    # eww
    # file
    # mediainfo
    # ddgr
    # traceroute
    # anydesk
    # azure-cli
    # wl-clip-persist
    # hyprpaper
    # hyprpolkitagent
    # kdePackages.dolphin
    # kdePackages.breeze-gtk
    # kdePackages.breeze-icons
    # kdePackages.qt6ct
    # libsForQt5.qt5ct
    # gum
    # peaclock
    # shellcheck
    # shfmt
    # glibc
    # smartmontools
    # lm_sensors
    # neofetch
    # gparted
    # htop
    # glances
    # glow
    # koboldcpp
    # nautilus
    # aider-chat
    # android-tools
    # nmap
    # miniupnpc
    # gupnp-tools
    # python313Packages.websocket-client
    # python313Packages.samsungctl
  ];
  # environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
}
