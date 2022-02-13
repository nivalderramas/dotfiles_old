local awful = require("awful")
local bling = require("modules.bling")

local table = {}

-- Add layouts before bar creation
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        bling.layout.centered,
        awful.layout.suit.tile,
        awful.layout.suit.floating,
    })

end)

table.decoration = require("ui.decoration")

require("ui.bar")

--require("ui.sidebar")
--require("ui.dock")

-- awful.layout.layouts = {
--     awful.layout.suit.tile,
--     awful.layout.suit.floating,
--     bling.layout.mstab
-- }
return table
