{ config, pkgs, hostSettings, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
# Host-specific monitor config (scale differs per device)
      #monitor = hostSettings.monitorConfig;
      "$mod" = "SUPER";
# Programs
      "$terminal" = "alacritty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

# Autostart
      exec-once = [
        "caelestia-shell & hypridle"
          #"hyprpaper & swaync"
          "sleep 5m & ~/nixos/wallpaper.sh"
      ];

# Environment variables
      env = [
        "XCURSOR_SIZE,32"
          "HYPRCURSOR_SIZE,32"
          "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];

# General
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgb(44475a) rgb(bd93f9) 90deg";
        "col.inactive_border" = "rgba(44475aaa)";
        "col.nogroup_border" = "rgba(282a36dd)";
        "col.nogroup_border_active" = "rgb(bd93f9) rgb(44475a) 90deg";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

# Decoration
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 60;
          render_power = 3;
          offset = "1 2";
          scale = 0.97;
          color = "rgba(1E202966)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

# Animations
      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
            "easeInOutCubic, 0.65, 0.05, 0.36, 1"
            "linear, 0, 0, 1, 1"
            "almostLinear, 0.5, 0.5, 0.75, 1"
            "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 10, default"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 3.5, easeOutQuint, popin 87%"
            "windowsOut, 1, 3.5, linear, popin 87%"
            "windowsMove, 1, 3.5, default"
            "layers, 1, 5, easeOutQuint"
            "layersIn, 1, 10, easeOutQuint, fade"
            "layersOut, 1, 5, linear, fade"
            "fade, 1, 3, quick"
            "fadeIn, 1, 3, almostLinear"
            "fadeOut, 1, 3, almostLinear"
            "fadeSwitch, 1, 4, default"
            "fadeDim, 1, 4, default"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "fadePopupsIn, 1, 4, default"
            "fadePopupsOut, 1, 4, default"
            "border, 1, 5.39, easeOutQuint"
            "borderangle, 1, 1, default"
            "workspaces, 1, 2.5, almostLinear, slidefade"
            "workspacesIn, 1, 2.5, almostLinear, slidefade"
            "workspacesOut, 1, 2.5, almostLinear, slidefade"
            "zoomFactor, 1, 7, quick"
            ];
      };

# Layouts
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master.new_status = "master";

# Misc
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

# Input
      input = {
        kb_layout = "de";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = false;
      };

# Per-device config
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

# Keybindings
      bind = [
        "$mod, Q, exec, $terminal"
          "$mod, C, killactive"
          "$mod, M, exit"
          "$mod, E, exec, $fileManager"
          "$mod, V, togglefloating"
          "$mod, P, pseudo"
          "$mod, J, togglesplit"
          "$mod, Y, exec, hyprctl reload"

# Focus
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

# Workspaces
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

# Move to workspaces
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"

# Scroll workspaces
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

# Screenshots
          "$mod SHIFT, S, exec, hyprshot -m region"
          "$mod CTRL, S, exec, hyprshot -m window"
          "$mod ALT, S, exec, hyprshot -m output"

# Caelestia Shell
          "$mod, R, global, caelestia:launcher"
          "$mod, N, global, caelestia:sidebar"
          "$mod, L, global, caelestia:lock"
          "$mod, D, global, caelestia:dashboard"
          "$mod SHIFT, P, global, caelestia:picker"
          "$mod SHIFT, E, global, caelestia:session"
          ];

# Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
      ];

# Media keys (with repeat)
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
          ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

# Media keys (no repeat)
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
          "$mod, Backspace, global, caelestia:clearNotifs"
      ];

# Window rules
      windowrule2 = [
        "suppressevent maximize, class:.*"
          "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
          "float, class:^(Mullvad VPN)$"
          "size 600 600, class:^(Mullvad VPN)$"
      ];
    };
  };
}
