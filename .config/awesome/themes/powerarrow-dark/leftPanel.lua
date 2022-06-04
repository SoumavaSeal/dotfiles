local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local bottomPanel = awful.wibar({
    position = "left", 
    screen = s, 
    width = dpi(50),
    bg = theme.bg_normal,
    fg = theme.fg_normal
})

s.bottomPanel:setup {
    layout = wibox.layout.align.vertical,
    { -- Left widgets
        layout = wibox.layout.fixed.vertical,
        s.mytaglist,
    },
    nil, -- Middle widget
    { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        wibox.container.background(s.mylayoutbox, theme.bg_focus),
    },
}


