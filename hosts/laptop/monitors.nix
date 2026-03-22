{ lib, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = lib.mkForce [
  "eDP-1, 2880x1800@120, 0x0, 1"
    ];
  };
}
