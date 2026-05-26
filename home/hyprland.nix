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
  xdg.configFile."hypr/laptop/monitors.lua" = {
    source = ../hosts/laptop/monitors.lua;
  };
  xdg.configFile."hypr/desktop/monitors.lua" = {
    source = ../hosts/desktop/monitors.lua;
  };
}
