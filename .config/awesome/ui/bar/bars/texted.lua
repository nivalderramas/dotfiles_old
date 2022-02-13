local gfs = require("gears.filesystem")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local icons = require('icons')
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local helpers = require("helpers")

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
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons =  keys.taglist_buttons,
        layout = {
            spacing = 15,
            layout = wibox.layout.fixed.horizontal,
        },
        widget_template = {
            widget = wibox.widget.textbox,
            create_callback = function(self, t, index, _)
                self.font = beautiful.taglist_font or "Sans 14"
                update_taglist(self, t, index)
            end,
            update_callback = function(self, t, index, _)
                update_taglist(self, t, index)
            end,
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar({position = "top", screen = s, bg = "#FFFFFF00",margins=dpi(10)})

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
        shape = helpers.rrect(dpi(10)),
        bg = beautiful.background,
    },
    -- s.mytasklist, -- Middle widget
    {
        {
            {
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(15),
                mytextclock,
            },
            widget = wibox.container.margin,
            left = dpi(10),
            right = dpi(10)
        },
        widget = wibox.container.background,
        shape = helpers.rrect(dpi(20)),
        bg = beautiful.background,
    },
    {-- Right widgets
    {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        battery_widget,
        cpu_widget,
        ram_widget,
        volume_widget,
        music_widget,
        helpers.horizontal_pad(dpi(15)),
        spacing = dpi(10),
    },
    widget = wibox.container.background,
    shape = helpers.rrect(dpi(20)),
    bg = beautiful.background,
},
    }
end)
