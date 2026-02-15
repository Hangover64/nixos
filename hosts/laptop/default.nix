{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # GPU - adjust to your laptop's GPU (Intel/AMD/Nvidia)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Laptop-specific: power management, battery, etc.
  # services.tlp.enable = true;
  # services.thermald.enable = true;
}
