{ config, pkgs, hostSettings, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {};
  };
  xdg.configFile."hypr/hyprland.lua" = {
    source = ./hyprland.lua;
  };
}
