local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local theme = require("themes.powerarrow-blue.theme")

local helpers = require("helpers")

local volume_widget = wibox.widget.textbox()

-- Yazı ayarları
volume_widget.font = beautiful.wibar_font or "sans 13"
-- desktop_control.forced_width = dpi(100)
volume_widget.markup = helpers.colorize_text("󰝞",theme.color2)
-- Tuşlar
volume_widget:buttons {
            awful.button({ }, 1, function() helpers.volume_control(0) end),
            awful.button({ }, 4, function() helpers.volume_control(5) end),
            awful.button({ }, 5, function() helpers.volume_control(-5) end),
}


-- Signals
awesome.connect_signal("evil::volume", function(volume, muted)
    local icon = muted and "󰕿" or "󰕾"
    volume_widget.markup = helpers.colorize_text(icon.." "..volume.."%",theme.color2)
end)

return volume_widget
