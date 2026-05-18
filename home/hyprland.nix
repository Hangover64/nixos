{ config, pkgs, hostSettings, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {};
    extraLuaConfig = builtins.readFile ./hyprland.lua;
  };
}
