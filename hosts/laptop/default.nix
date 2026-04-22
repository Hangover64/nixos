{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hyprland.nix
  ];

# GPU - adjust to your laptop's GPU (Intel/AMD/Nvidia)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    intel-media-driver
  ];

# Laptop-specific: power management, battery, etc.
# services.tlp.enable = true;
# services.thermald.enable = true;
}
