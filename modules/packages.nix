{ pkgs, ... }:
{
  programs.firefox.enable = true;
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraProfile = ''
      export PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1
      unset TZ
      '';
    };
  };


  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
# CLI tools
      wget
      zip
      unzip
      fish
      diffutils
      ffmpeg
      eza
      zoxide
      upower

      zip
      unzip
      fish
      diffutils
      ffmpeg
      acpi
      gpu-screen-recorder
      gpu-screen-recorder-gtk
      

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
      proton-vpn

# Gaming
      prismlauncher
      xrizer


    # Misc
    docker
    nix-ld
    gparted
    gptfdisk
    xfsprogs
  ];
}
