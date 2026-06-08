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


 xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  services.hydra = {
    enable = true;
    hydraURL = "http://localhost:3000";
    notificationSender = "hydra@localhost";
    useSubstitutes = true;
  };

  programs.coolercontrol.enable = true;


  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
# CLI tools
      wget
      tmux
      zip
      unzip
      diffutils
      ffmpeg
      eza
      zoxide
      upower
      just
      pstree
      zip
      unzip
      diffutils
      ffmpeg
      acpi
      gpu-screen-recorder
      gpu-screen-recorder-gtk
      ooniprobe-cli
      btop
      fastfetch
      tree
      file
      gunmake
      yazi
      ueberzugpp

#Hardware
      coolercontrol.coolercontrold
      coolercontrol.coolercontrol-gui
      coolercontrol.coolercontrol-ui-data
      

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
      lmstudio
      nodejs
      docker
      nix-ld
      gparted
      gptfdisk
      xfsprogs
      python3
      python3Packages.dbus-python
      imagemagick


# Media
      smplayer
      mpv
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
      slurp
      wl-clipboard
      libnotify

# VPN
      proton-vpn

# Gaming
      prismlauncher
      xrizer
   ];
}
