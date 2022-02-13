local gears = require("gears")
local theme = require("themes.powerarrow-blue.theme")
local function file_exists(path)
    -- Try to open it
    local f = io.open(path)
    if f then
        f:close()
        return true
    end
    return false
end


local icons = {}
icons.image = {}
icons.text = {}

-- TODO Set up weather text icons here instead of in ../noodle/text_weather.lua
-- icons.text.weather = {}

-- Set up text symbols and accent colors to be used in tasklists or docks
-- instead of awful.widget.clienticon
-- Based on the client's `class` property
-- TODO Ability to match using rules instead of just class
icons.text.by_class = {
    -- Terminals
    ['Alacritty'] = { symbol = "", color = theme.color5 },
    ['Termite'] = { symbol = "", color = theme.color5 },
    ['URxvt'] = { symbol = "", color = theme.color5 },
    ['st'] = { symbol = "", color = theme.color5 },
    ['st-256color'] = { symbol = "", color = theme.color5 },

    -- Image viewers
    ['feh'] = { symbol = "", color = theme.color1 },
    ['Sxiv'] = { symbol = "", color = theme.color1 },

    -- General
    ['TelegramDesktop'] = { symbol = "", color = theme.color4 },
    ['Firefox'] = { symbol = "", color = theme.color3 },
    ['firefox'] = { symbol = "", color = theme.color3 },
    ['Nightly'] = { symbol = "", color = theme.color4 },
    ['Chromium'] = { symbol = "", color = theme.color4 },
    ['Chromium-browser'] = { symbol = "", color = theme.color4 },
    ['Steam'] = { symbol = "", color = theme.color2 },
    ['Lutris'] = { symbol = "", color = theme.color6 },
    ['editor'] = { symbol = "", color = theme.color5 },
    ['Emacs'] = { symbol = "", color = theme.color2 },
    ['email'] = { symbol = "", color = theme.color6 },
    ['music'] = { symbol = "", color = theme.color6 },
    ['mpv'] = { symbol = "", color = theme.color6 },
    ['KeePassXC'] = { symbol = "", color = theme.color1 },
    ['Gucharmap'] = { symbol = "", color = theme.color6 },
    ['Pavucontrol'] = { symbol = "", color = theme.color4 },
    ['htop'] = { symbol = "", color = theme.color2 },
    ['Screenruler'] = { symbol = "", color = theme.color3 },
    ['Galculator'] = { symbol = "", color = theme.color2 },
    ['Zathura'] = { symbol = "", color = theme.color2 },
    ['Qemu-system-x86_64'] = { symbol = "", color = theme.color3 },
    ['Wine'] = { symbol = "", color = theme.color1 },
    ['markdown_input'] = { symbol = "", color = theme.color2 },
    ['scratchpad'] = { symbol = "", color = theme.color1 },
    ['weechat'] = { symbol = "", color = theme.color5 },
    ['discord'] = { symbol = "", color = theme.color5 },
    ['6cord'] = { symbol = "", color = theme.color3 },
    ['libreoffice-writer'] = { symbol = "", color = theme.color4 },
    ['libreoffice-calc'] = { symbol = "", color = theme.color2 },
    ['libreoffice-impress'] = { symbol = "", color = theme.color1 },
    ['Godot'] = { symbol = "", color = theme.color4 },

    -- File managers
    ['Thunar'] = { symbol = "", color = theme.color3 },
    ['Nemo'] = { symbol = "", color = theme.color3 },
    ['files'] = { symbol = "", color = theme.color3 },

    ['Gimp'] = { symbol = "", color = theme.color4 },
    ['Inkscape'] = { symbol = "", color = theme.color2 },
    ['Gpick'] = { symbol = "", color = theme.color6 },

    -- Default
    ['_'] = { symbol = "", color = theme.color7.."99" }
}

-- Available icons
local image_icon_names = {
    "playerctl_toggle",
    "playerctl_prev",
    "playerctl_next",
    "stats",
    "search",
    "volume",
    "muted",
    "firefox",
    "youtube",
    "reddit",
    "discord",
    "telegram",
    "steam",
    "games",
    "files",
    "manual",
    "keyboard",
    "appearance",
    "editor",
    "redshift",
    "gimp",
    "terminal",
    "mail",
    "music",
    "temperature",
    "battery",
    "battery_charging",
    "cpu",
    "compositor",
    "start",
    "ram",
    "screenshot",
    "home",
    "alarm",
    "alarm_off",
    "alert",
    "submenu",
    -- Weather icons
    "cloud",
    "dcloud",
    "ncloud",
    "sun",
    "star",
    "rain",
    "snow",
    "mist",
    "storm",
    "whatever",
    -- Exit screen icons
    "exit",
    "poweroff",
    "reboot",
    "suspend",
    "lock",
}

-- Path to icons
local p


-- Set all the icon variables
function icons.init(theme_name)
    -- Set the path to image icons
    p = gears.filesystem.get_configuration_dir().."icons/"..theme_name.."/"

    for i = 1, #image_icon_names do
        set_image_icon(image_icon_names[i])
    end

    -- Set symbols and accent colors for text icons
end

return icons
