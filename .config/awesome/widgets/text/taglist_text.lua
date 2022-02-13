local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local keys = require("keys")

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

local gen_taglist = function(s)
    local taglist = awful.widget.taglist {
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
    return taglist
end
return gen_taglist
