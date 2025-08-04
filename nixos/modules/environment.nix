{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # ! --- Nix & Dev Tools ---
    pciutils
    # new START
    # gsettings-qt # Qt-based settings for GNOME
    # komorebi
    # xorg.xcursorthemes
    # gsettings-desktop-schemas # Schemas for GNOME desktop settings
    # gnome.nixos-gsettings-overrides # NixOS overrides for GNOME settings
    libreoffice-qt6-fresh # office apps
    net-tools
    libnotify
    pamixer
    yad
    cava
    networkmanagerapplet # Applet for managing network connections in GNOME
    ayu-theme-gtk # Ayu GTK theme for a clean and modern look
    gruvbox-kvantum # Gruvbox Kvantum theme for a retro groove color scheme
    gtk-engine-murrine # Murrine GTK engine for custom themes
    gruvbox-gtk-theme # Gruvbox GTK theme for a retro groove color scheme
    gnome-themes-extra # Extra GNOME themes
    gnome-calculator # GNOME calculator application
    gnome-text-editor # GNOME text editor
    pavucontrol # PulseAudio volume control GUI
    # walker # A tool for managing and navigating Nix packages and environments.
    nwg-look # A tool for managing GTK themes, icons, and cursors in a user-friendly way.
    swaynotificationcenter
    seahorse # GNOME password manager
    nautilus # GNOME file manager
    xfce.xfce4-icon-theme
    arc-theme
    # hyprshot # A screenshot tool for Hyprland (Wayland) that allows capturing screenshots with various options.
    powertop

    # new END
    hyprls # language server for Hyprland, providing code intelligence and autocompletion for Hyprland configuration files.
    nil # Nix language server (LSP) for providing code intelligence for Nix expressions.
    # devenv # A tool for creating declarative, reproducible, and composable developer environments using Nix.
    # fnm
    nixfmt-rfc-style # The official Nix code formatter, adhering to RFC 166 style guidelines, for consistent Nix code.
    corepack # A Node.js tool that manages package manager versions (like npm, yarn, pnpm) for projects.
    # nodejs # JavaScript runtime environment built on Chrome's V8 engine, for executing JavaScript code outside a browser.
    nodejs_24
    # nodejs-slim_24
    bun # A fast all-in-one JavaScript runtime, bundler, transpiler, and package manager.
    # typescript # A superset of JavaScript that adds static typing, enhancing code quality and maintainability.
    # typescript-language-server # A language server that provides TypeScript and JavaScript language features to code editors.
    # eslint # A pluggable and configurable linter tool for identifying and reporting on patterns in JavaScript and TypeScript code.
    # eslint_d # A daemonized version of ESLint that provides faster linting by keeping ESLint running in the background.
    # prettierd # A daemonized version of Prettier, a code formatter, for faster code formatting.
    nodePackages_latest.vercel # The Vercel CLI, used for deploying web projects to the Vercel platform.
    pipx
    python313 # The Python 3.13 interpreter.
    # python313Packages.yowsup # A Python library for creating WhatsApp clients, specifically for Python 3.13.
    # python311Packages.pip # The package installer for Python, used to install and manage Python packages (for Python 3.11 in this case).
    # zig # Programming language and toolchain
    # gcc # GNU Compiler Collection
    git # Distributed version control system
    gh # GitHub CLI tool
    gof5 # Open source F5 BIG-IP VPN client for Linux, MacOS, FreeBSD, Windows
    # openconnect_openssl # OpenConnect VPN client (with OpenSSL)
    #docker-credential-helpers # Docker credential storage helpers

    # ! --- Editors & IDEs ---
    vscode # Visual Studio Code editor
    neovim # Modern Vim-based text editor

    # ! --- Browsers ---
    google-chrome # Web browser by Google
    brave # Privacy-focused web browser
    firefox # Mozilla web browser
    chromium # Open-source web browser project

    # ! --- Media & Graphics ---
    mpv # Media player
    vlc # Versatile media player
    webtorrent_desktop # Streaming torrent client
    obs-studio # Open source video recording and streaming
    file
    mediainfo

    # ! --- Networking & Remote ---
    ddgr # DuckDuckGo search from the command line
    wget # Network downloader
    traceroute # Network diagnostic tool
    anydesk # Remote desktop application
    postman # API testing tool
    azure-cli # Microsoft Azure command-line interface
    deluge # BitTorrent client

    # ! --- Hyprland & Wayland ---
    wl-clip-persist # Keeps Wayland clipboard after program exit
    # swappy # Image editor for Wayland
    hyprpaper # Fast wallpaper utility for Hyprland (Wayland)
    hyprpolkitagent # Polkit authentication agent for Hyprland, written in QT/QML
    grimblast # Screenshot helper for Hyprland (Wayland)
    wofi # Application launcher for Wayland
    wl-clipboard # Command-line copy/paste for Wayland

    # ! --- KDE & Qt ---
    #kdePackages.dolphin # KDE file manager
    kdePackages.spectacle # KDE screenshot tool
    kdePackages.breeze-gtk # GTK theme for KDE Breeze
    kdePackages.breeze-icons # Icon theme for KDE Breeze
    kdePackages.qt6ct # Qt6 configuration tool
    libsForQt5.qt5ct # Qt5 configuration tool

    # ! --- System Utilities ---
    gum # A tool for creating interactive command-line prompts and menus
    peaclock # A simple, customizable clock for the terminal
    atuin # Command-line shell history manager with search and sync capabilities
    ffmpeg # Multimedia framework for handling video, audio, and other multimedia files
    shellcheck # Shell script analysis tool
    shfmt # Shell script formatter
    jq # Command-line JSON processor
    bat # A cat clone with syntax highlighting and Git integration
    kitty # Terminal emulator
    # glibc # GNU C Library, core C runtime for Linux
    brightnessctl # Control device brightness from the command line
    playerctl # Command-line controller for media players
    smartmontools # Tools for monitoring SMART-enabled hard drives
    lm_sensors # Hardware health monitoring (sensors)
    starship # Cross-shell prompt for minimal, fast, informative shell prompts
    neofetch # System information tool
    gparted # GNOME partition editor
    acpi # Show battery and ACPI information
    btop # Resource monitor
    htop # Interactive process viewer
    glances # Cross-platform system monitoring tool
    tree # Directory listing in tree format
    unzip # Extract compressed .zip files
    fzf # Fuzzy finder for the command line
    tldr # Simplified and community-driven man pages
    eza # Modern replacement for 'ls' command
    dust # More intuitive version of 'du' for disk usage
    fd # Simple, fast and user-friendly alternative to 'find'
    ripgrep # Fast search tool (like grep)
    silver-searcher # Fast code-searching tool, similar to ack
    glow # Terminal markdown reader
    clipse # Terminal-based clipboard manager (TUI) for Unix
    koboldcpp # Easy-to-use AI text-generation software for GGML/GGUF models
    aider-chat # AI coding assistant for working with codebases

    # ! zsh
    zsh-completions # Additional Zsh completions for various commands

    # ! --- hacking ---
    # android-tools
    # nmap # Network exploration tool and security/port scanner
    # miniupnpc # MiniUPnP client and server library
    # gupnp-tools # GUPnP tools for UPnP devices
    # python313Packages.websocket-client
    # python313Packages.samsungctl # A Python library for controlling Samsung Smart TVs.

  ];

}
