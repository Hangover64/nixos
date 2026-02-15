{ pkgs, ... }:
{
  programs.firefox.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # CLI tools
    wget
    zip
    unzip
    fish
    diffutils
    ffmpeg

    # Terminal
    alacritty

    # Development
    python315
    python313Packages.pydbus
    gcc
    glibc.static
    nil
    clang-tools
    libclang
    rustup
    claude-code

    # Media
    smplayer
    mpv
    mpvpaper
    waypaper
    cava
    cmatrix

    # Hyprland extras
    quickshell
    dbus

    # Caelestia
    swappy
    grim
    dart-sass
    app2unit
    cliphist
    fuzzel

    # Screenshot
    flameshot
    slurp
    wl-clipboard
    libnotify

    # VPN
    protonvpn-gui

    # Gaming
    prismlauncher

    # Misc
    docker
    nix-ld
  ];
}
