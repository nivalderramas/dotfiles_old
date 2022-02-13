-- keys.lua
-- Contains Global Keys
local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful     = require("beautiful")

local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local lain          = require("lain")
local modkey       = "Mod4"
local altkey       = "Mod1"
local modkey1      = "Control"

-- personal variables
local browser           = "vivaldi-stable"
local editor            = os.getenv("EDITOR") or "vim"
local editorgui         = "geany"
local filemanager       = "ranger"
local mailclient        = "geary"
local mediaplayer       = "vlc"
local scrlocker         = "slimlock"
local terminal          = "alacritty"
local virtualmachine    = "virtualbox"

-- state variables
local dualSetup = false

-- awesome variables awful.util.terminal = terminal
-- Custom modules
globalkeys = my_table.join(

    -- {{{ Personal keybindings

    awful.key({ modkey}, "p", function () awful.util.spawn("rofi -show run -dpi 163") end,
        {description = "open rofi " , group = "gui apps" }),
    awful.key({ modkey, "Shift"}, "p", function () awful.util.spawn("rofi -modi drun -show drun -show-icons -width 22 -no-click-to-exi -dpi 163",false) end,
        {description = "open rofi " , group = "gui apps" }),
    -- My applications (Super+Alt+Key)
    awful.key({ modkey}, "z", function () awful.util.spawn(browser) end,
        {description = "open web browser" , group = "gui apps" }),
    awful.key({ modkey}, "o", function () awful.spawn(terminal.." -e "..filemanager) end,
        {description = "open web browser" , group = "gui apps" }),
    awful.key({ modkey}, "y", function () awful.util.spawn("teams") end,
        {description = "open web browser" , group = "gui apps" }),
    awful.key({ modkey}, "v", function () awful.util.spawn("pavucontrol") end,
        {description = "open web browser" , group = "gui apps" }),
    awful.key({ modkey}, "t", function () awful.util.spawn("telegram-desktop") end,
        {description = "open telegram" , group = "gui apps" }),
    -- screenshots
    awful.key({ }, "Print", function () awful.util.spawn("flameshot gui") end,
        {description = "Scrot", group = "screenshots"}),


    awful.key({ modkey, "Shift"}, "i", function () awful.spawn.with_shell("xrandr --output HDMI-A-0 --scale 1.4x1.4") end,
        {description = "downscale hdmi", group = "tools"}),
    awful.key({ modkey }, "i", 
    function () 
        if( dualSetup == false) then
            awful.spawn.with_shell("~/.screenlayout/dual.sh")
            dualSetup = true
            awful.spawn.with_shell("xrandr --output HDMI-A-0 --scale 1.4x1.4")
        else
            awful.spawn.with_shell("~/.screenlayout/mono.sh")
            dualSetup = false
        end
    end,
        {description = "Scrot", group = "screenshots"}),

    -- Hotkeys Awesome

    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
        {description = "show help", group="awesome"}),


    -- Non-empty tag browsing
    --awful.key({ modkey }, "Left", function () lain.util.tag_view_nonempty(-1) end,
              --{description = "view  previous nonempty", group = "tag"}),
   -- awful.key({ modkey }, "Right", function () lain.util.tag_view_nonempty(1) end,
             -- {description = "view  previous nonempty", group = "tag"}),

    -- Default client focus
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    awful.key({ modkey,           }, "w", function () awful.util.mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey }, ".", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey }, ",", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    -- Show/Hide Wibox
    awful.key({ modkey }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "toggle wibox", group = "awesome"}),

    -- On the fly useless gaps change
    awful.key({ altkey, "Control" }, "j", function () lain.util.useless_gaps_resize(1) end,
              {description = "increment useless gaps", group = "tag"}),
    --awful.key({ altkey, "Control" }, "l", function () lain.util.useless_gaps_resize(-1) end,
              --{description = "decrement useless gaps", group = "tag"}),


    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn( terminal.." -e fish" ) end,
              {description = "terminal with fish shell", group = "super"}),
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q",  function () awful.spawn.with_shell( 'killall awesome' ) end,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey}, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey}, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey,"Shift"}, "space", function () awful.layout.inc( -1)                end,
              {description = "select prev", group = "layout"}),
    --awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
             -- {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Widgets popups
    -- ALSA volume control
    --awful.key({ modkey1 }, "Up",
awful.key({},"XF86AudioPlay",
                           function() awful.spawn("playerctl play-pause")end),
                 awful.key({},"XF86AudioPrev",
                           function() awful.spawn("playerctl previous")end),
                 awful.key({},"XF86AudioNext",
                           function() awful.spawn("playerctl next")end),
    awful.key({ }, "XF86AudioStop", function () awful.util.spawn("playerctl --all-players play-pause") end,
        {description = "pause" , group = "gui apps" }),
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            os.execute(string.format("amixer -q set %s 3%%+", beautiful.volume.channel))
            beautiful.volume.update()
        end),
    --awful.key({ modkey1 }, "Down",
    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            os.execute(string.format("amixer -q set %s 3%%-", beautiful.volume.channel))
            beautiful.volume.update()
        end),
    awful.key({ }, "XF86AudioMute",
        function ()
            os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end),
    awful.key({ modkey1, "Shift" }, "m",
        function ()
            os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
            beautiful.volume.update()
        end),
    awful.key({ modkey1, "Shift" }, "0",
        function ()
            os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
            beautiful.volume.update()
        end),

    -- Copy primary to clipboard (terminals to gtk)
    awful.key({ modkey }, "c", function () awful.spawn.with_shell("xsel | xsel -i -b") end,
              {description = "copy terminal to gtk", group = "hotkeys"}),
    -- Copy clipboard to primary (gtk to terminals)
    awful.key({ modkey }, "v", function () awful.spawn.with_shell("xsel -b | xsel") end,
              {description = "copy gtk to terminal", group = "hotkeys"}),


    -- Default
    --[[ Menubar

    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "super"})
    --]]

    awful.key({ altkey, "Shift" }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})
    --]]
)

clientkeys = my_table.join(
    awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client,
              {description = "magnify client", group = "client"}),
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey}, "q",      function (c) c:kill()                         end,
              {description = "close", group = "hotkeys"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move)
        -- Toggle tag on focused client.
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
