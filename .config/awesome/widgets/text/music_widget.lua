local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local awful = require("awful")
local theme = require("themes.powerarrow-blue.theme")

local helpers = require("helpers")

local music_widget = wibox.widget.textbox()
-- Yazı ayarları
music_widget.font = beautiful.wibar_font or "sans 13"
music_widget.markup = helpers.colorize_text("",theme.color2)
-- Tuşlar
music_widget:buttons {
	awful.button({},1,function()
		helpers.single_double_tap(function() 
			awful.spawn("mpc -q toggle") 
		end ,
		function() awful.spawn("mpc -q next")
		end) 
	end ),
	awful.button({},3,function() awful.spawn("mpc -q prev")
	end)
}

-- Signals
awesome.connect_signal("evil::mpd", function(artist, title, paused, filename)
    local color = paused and theme.color4 or theme.color5
    music_widget.markup = helpers.colorize_text("󰐌 ".. title, color)
end)

return music_widget
