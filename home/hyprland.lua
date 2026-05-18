local terminal = "alacritty"
local fileManager = "dolphin"
local mainMod = "SUPER"


hl.on("hypland.start", function () 
  hl.exec_cmd("caelestia-shell & sleep 5m & ~/nixos/wallpaper.sh")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    border_size = 2,
    col = {
      active_border = { colors = {"rgb(44475a)", "rgb(bd93f9)"}, },
      -- inactive_border 
    }
  }
})

hl.config({
  input = {
    kb_layout = "de",
    follow_mouse = 1,
    touchpad = {
      natural_scroll = false,
    }
  }
})

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
