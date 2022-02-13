local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local helpers = require("helpers")

local music_player = wibox.widget.textbox()

-- Yazı ayarları
music_player.font = "monospace 13"
music_player.markup = " Requiem"
music_player.align = "center"
-- desktop_control.forced_width = dpi(100)

-- Mouse control
--   desktop_control:buttons(gears.table.join(
--       -- Left click - Cycle through layouts
--       awful.button({ }, 1, function ()
--           awful.layout.inc(1)
--       end),
--       -- Right click - Show clients in the current tag with rofi
--       awful.button({ }, 3, function ()
--           awful.spawn.with_shell("rofi -matching fuzzy -show windowcd")
--       end),
--       -- Middle click - Close focused client
--       awful.button({ }, 2, function ()
--           if client.focus ~= nil then
--             client.focus:kill()
--           end
--       end),
--       -- Scrolling - Scroll through clients
--       awful.button({ }, 4, function ()
--           awful.client.focus.byidx(-1)
--       end),
--       awful.button({ }, 5, function ()
--           awful.client.focus.byidx(1)
--       end),
--       -- Side buttons - Minimize and restore minimized
--       awful.button({ }, 8, function ()
--           if client.focus ~= nil then
--             client.focus.minimized = true
--           end
--       end),
--       awful.button({ }, 9, function ()
--           local c = awful.client.restore()
--           if c then
--             client.focus = c
--           end
--       end)
--   ))

--  local function update_widget()
--      local current_layout = awful.layout.get(mouse.screen)
--      local layout_name = awful.layout.getname(current_layout)
--      local color = beautiful.layout_color and beautiful.layout_color[layout_name] or x.color4
--      desktop_control.markup = helpers.colorize_text("[" .. layout_name .. "]",color)
--  end

return music_player
