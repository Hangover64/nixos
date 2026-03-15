{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
    "DP-3,1920x1080@144,0x0,1,transform,3"
    "DP-1,1920x1080@144,1080x0,1"
    "DP-2,2560x1440@240,3000x0,1"
    ];
    workspace[
    "1, monitor:DP-2, default:true"
    "2, monitor:DP-1"
    "3, monitor:DP-3"
    ]
  };
}
