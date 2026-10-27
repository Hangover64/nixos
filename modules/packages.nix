{ pkgs, lib, ... }:
{
  programs.firefox.enable = true;
  programs.steam = {
    enable = true;
  };


 xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = [ "gtk" ];
      };
      hyprland = {
        default = [ "hyprland" "gtk" ];
      };
    };
  };

  # Prevent xdg-desktop-portal from failing if graphical-session.target is not reached immediately
  systemd.user.services.xdg-desktop-portal.unitConfig.Requisite = lib.mkForce "";

  services.hydra = {
    enable = true;
    hydraURL = "http://localhost:3000";
    notificationSender = "hydra@localhost";
    useSubstitutes = true;
  };
  
  virtualisation.docker = {
    enable = true;
  };

  programs.coolercontrol.enable = true;


  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
# CLI tools
      usbutils
      evtest
      ncdu
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
      acpi
      gpu-screen-recorder
      gpu-screen-recorder-gtk
      ooniprobe-cli
      btop
      fastfetch
      tree
      file
      gnumake
      yazi
      ueberzugpp
      protontricks

#Hardware
      coolercontrol.coolercontrold
      coolercontrol.coolercontrol-gui
      coolercontrol.coolercontrol-ui-data
      

# Terminal

# Development
      gcc
      glibc.static
      nil
      clang-tools
      libclang
      rustup
      lmstudio
      nodejs
      nix-ld
      gparted
      gptfdisk
      xfsprogs
      python3
      imagemagick
      maven


# Media
      mpv
      cmatrix

# Hyprland extras
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

# Gaming
      prismlauncher
      xrizer
   ];
}
