local gears = require("gears")
local gfs = gears.filesystem
local awful = require("awful")
local wibox = require("wibox")
local icons = require('icons')
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local helpers = require("helpers")
local widgets = require("widgets.text")
local keys = require("keys")

local battery_widget = widgets.battery_widget
local cpu_widget     = widgets.cpu_widget
local layout_control = widgets.layout_control
local music_widget   = widgets.music_widget
local ram_widget     = widgets.ram_widget
local taglist_text   = widgets.taglist_text
local volume_widget  = widgets.volume_widget
local clock_widget   = widgets.clock_widget



local update_taglist = function (item, t, index)
    if t.selected then
        color = beautiful.tag_colors_focused[index]
    elseif t.urgent then
        color = beautiful.tag_colors_urgent[index]
    elseif #t:clients() > 0 then
        color = beautiful.tag_colors_occupied[index]
    else
        color = beautiful.tag_colors_empty[index]
    end
    if color then
        item.markup = helpers.colorize_text(t.name,color)
    end
end

-- Emitted when a new screen is added
screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX" }, s, awful.layout.layouts[1])

    -- Create a taglist widget
    s.mytaglist = taglist_text(s)

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        bg = "#FFFFFF00",
        margins=dpi(10)
    })

    -- Add widgets to the wibox
    s.mywibox:setup  {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
        {
            {
                spacing = dpi(15),
                layout = wibox.layout.fixed.horizontal,
                layout_control,
                s.mytaglist,
            },
            widget = wibox.container.margin,
            left = dpi(10),
            right = dpi(10),
        },
        widget = wibox.container.background,
        shape = helpers.rrect(dpi(20)),
        bg = beautiful.background,
    },
    -- Middle widget
    {
        {
            {
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(15),
                clock_widget,
            },
            widget = wibox.container.margin,
            left = dpi(10),
            right = dpi(10)
        },
        widget = wibox.container.background,
        shape = helpers.rrect(dpi(20)),
        bg = beautiful.background,
    },
    -- Right widgets
    {
        {
            {
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(15),
                battery_widget,
                cpu_widget,
                ram_widget,
                volume_widget,
                music_widget,
            },
            widget = wibox.container.margin,
            left = dpi(10),
            right = dpi(10)
        },
        widget = wibox.container.background,
        shape = helpers.rrect(dpi(20)),
        bg = beautiful.background,
    },
}
end)
