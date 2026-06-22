{ config, pkgs, hostSettings, ... }:
{

  xdg.configFile."hypr/hyprland.lua" = {
    source = ./hyprland.lua;
  };
  xdg.configFile."hypr/laptop/monitors.lua" = {
    source = ../hosts/laptop/monitors.lua;
  };
  xdg.configFile."hypr/laptop/cursor.lua" = {
    source = ../hosts/laptop/cursor.lua;
  };
  xdg.configFile."hypr/desktop/monitors.lua" = {
    source = ../hosts/desktop/monitors.lua;
  };
  xdg.configFile."hypr/desktop/cursor.lua" = {
    source = ../hosts/desktop/cursor.lua;
  };
}
