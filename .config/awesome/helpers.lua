-- Functions that you use more than once and in different files would
-- be nice to define here.

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local wibox = require("wibox")

local helpers = {}

-- Create rounded rectangle shape (in one line)
helpers.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

helpers.prrect = function(radius, tl, tr, br, bl)
    return function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl, radius)
    end
end

helpers.squircle = function(rate, delta)
    return function(cr, width, height)
        gears.shape.squircle(cr, width, height, rate, delta)
    end
end
helpers.psquircle = function(rate, delta, tl, tr, br, bl)
    return function(cr, width, height)
        gears.shape.partial_squircle(cr, width, height, tl, tr, br, bl, rate, delta)
    end
end

-- Color texts
helpers.colorize_text = function(text, color)
    return "<span foreground='"..color.."'>"..text.."</span>"
end

function helpers.volume_control(step)
    local cmd
    if step == 0 then
        cmd = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    else
        sign = step > 0 and "+" or ""
        cmd = "pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ "..sign..tostring(step).."%"
    end
    awful.spawn.with_shell(cmd)
end

function helpers.vertical_pad(height)
    return wibox.widget{
        forced_height = height,
        layout = wibox.layout.fixed.vertical
    }
end
 
function helpers.horizontal_pad(width)
    return wibox.widget{
        forced_width = width,
        layout = wibox.layout.fixed.horizontal
    }
end

-- Tag back and forth:    
-- If you try to focus the tag you are already at, go back to the previous tag.
-- Useful for quick switching after for example checking an incoming chat  
-- message at tag 2 and coming back to your work at tag 1 with the same
-- keypress.
function helpers.tag_back_and_forth(tag_index)
    local s = mouse.screen
    local tag = s.tags[tag_index]
    if tag then
        if tag == s.selected_tag then
            awful.tag.history.restore()
        else
            tag:view_only()
        end
    end
end   

function helpers.single_double_tap(single_tap_function, double_tap_function)
    if double_tap_timer then
        double_tap_timer:stop()
        double_tap_timer = nil
        double_tap_function()
        -- naughty.notify({text = "We got a double tap"})
        return
    end

    double_tap_timer =
        gears.timer.start_new(0.20, function()
            double_tap_timer = nil
            -- naughty.notify({text = "We got a single tap"})
            if single_tap_function then
                single_tap_function()
            end
            return false
        end)
end


return helpers
