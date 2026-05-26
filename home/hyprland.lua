-- =============================================================================
-- Hyprland Lua Configuration
-- Docs: https://wiki.hypr.land/Configuring/Start/
-- =============================================================================

-- Variables
local mod         = "SUPER"
local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"


local function get_hostname()
  local f = io.open("/proc/sys/kernel/hostname", "r")
  if f then
    local h = f:read("*1")
    f:close()
    return h
  end
  return ""
end

local hostname = get_hostname()

if hostname == "nixos-desktop" then
  require("/home/hendrikf/nixos/hosts/desktop/monitors.lua")
elseif hostname == "nixos-laptop" then
  require("/home/hendrikf/nixos/hosts/laptop/monitors.lua")
end
-- =============================================================================
-- Autostart
-- =============================================================================
hl.on("hyprland.start", function()
    hl.exec_cmd("caelestia-shell & hypridle")
    hl.exec_cmd("sleep 5m && ~/nixos/wallpaper.sh")
end)

-- =============================================================================
-- Environment Variables
-- =============================================================================
hl.env("XCURSOR_SIZE",                 "32")
hl.env("HYPRCURSOR_SIZE",              "32")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- =============================================================================
-- General Config
-- =============================================================================
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 5,
        border_size = 2,
        col = {
            active_border         = { colors = { "rgb(44475a)", "rgb(bd93f9)" }, angle = 90 },
            inactive_border       = "rgba(44475aaa)",
            nogroup_border        = "rgba(282a36dd)",
            nogroup_border_active = { colors = { "rgb(bd93f9)", "rgb(44475a)" }, angle = 90 },
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 10,
        rounding_power   = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 60,
            render_power = 3,
            offset       = "1 2",
            scale        = 0.97,
            color        = "rgba(1E202966)",
        },
        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },

    input = {
        kb_layout    = "de",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Per-device config
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- =============================================================================
-- Animations
-- (Note: parameter is `bezier`, not `curve`)
-- =============================================================================
--
--
--
--
--
-- =============================================================================
-- Bezier Curves (must be defined before animations use them)
-- =============================================================================
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 3.5,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 3.5,  bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 3.5,  bezier = "default" })
hl.animation({ leaf = "layers",        enabled = true, speed = 5,    bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 10,   bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 5,    bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3,    bezier = "quick" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 3,    bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 3,    bezier = "almostLinear" })
hl.animation({ leaf = "fadeSwitch",    enabled = true, speed = 4,    bezier = "default" })
hl.animation({ leaf = "fadeDim",       enabled = true, speed = 4,    bezier = "default" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "fadePopupsIn",  enabled = true, speed = 4,    bezier = "default" })
hl.animation({ leaf = "fadePopupsOut", enabled = true, speed = 4,    bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "borderangle",   enabled = true, speed = 1,    bezier = "default" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 2.5,  bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 2.5,  bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.5,  bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- =============================================================================
-- Keybindings
-- (Note: hl.dsp.window.close() = killactive, hl.dsp.window.kill() kills ALL
--  instances of that app — confusing footgun)
-- =============================================================================
hl.bind(mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + Y", hl.dsp.exec_cmd("hyprctl reload"))

-- Focus
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces and move-to-workspace
for i = 1, 10 do
    local key = i % 10 -- 10 maps to 0
    hl.bind(mod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Screenshots
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mod .. " + CTRL + S",  hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mod .. " + ALT + S",   hl.dsp.exec_cmd("hyprshot -m output"))

-- Caelestia Shell (global dispatchers)
hl.bind(mod .. " + R",         hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))
hl.bind(mod .. " + N",         hl.dsp.global("caelestia:sidebar"))
hl.bind(mod .. " + L",         hl.dsp.global("caelestia:lock"))
hl.bind(mod .. " + D",         hl.dsp.global("caelestia:dashboard"))
hl.bind(mod .. " + SHIFT + P", hl.dsp.global("caelestia:picker"))
hl.bind(mod .. " + SHIFT + E", hl.dsp.global("caelestia:session"))
hl.bind(mod .. " + Backspace", hl.dsp.global("caelestia:clearNotifs"))

-- Mouse bindings
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys (locked = works when screen locked, repeating = key repeat)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media keys (locked, no repeat)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- =============================================================================
-- Window Rules
-- =============================================================================
hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
