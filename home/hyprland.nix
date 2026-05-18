{ config, pkgs, hostSettings, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {};
    extraConfig = builtins.readFile ./hyprland.lua;
    #blah
  };
}
