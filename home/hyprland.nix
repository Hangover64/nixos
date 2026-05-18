{ config, pkgs, hostSettings, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {};
  };
  xdg.configFile."hypr/hyprland.lua" = {
    source = ./hyprland.lua;
  };
}
