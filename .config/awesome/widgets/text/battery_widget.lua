local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local theme = require("themes.powerarrow-blue.theme")

local helpers = require("helpers")

local battery_widget = wibox.widget.textbox()

-- Yazı ayarları
battery_widget.font = beautiful.wibar_font or "sans 13"
-- desktop_control.forced_width = dpi(100)
battery_widget.markup = helpers.colorize_text("󱐋",theme.color1)
-- Tuşlar
-- YOK

-- Signals
awesome.connect_signal("evil::battery", function(percentage)
    battery_widget.markup = helpers.colorize_text("󱐋 "..percentage.."%",theme.color1)
end)

return battery_widget
