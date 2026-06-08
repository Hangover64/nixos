{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hyprland.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    intel-media-driver
  ];
}
