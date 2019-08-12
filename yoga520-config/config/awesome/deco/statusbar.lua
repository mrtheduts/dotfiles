-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist   = require("deco.taglist"),
    tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock("%H%n%M")

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout  = wibox.layout.ratio.vertical,
        buttons = taglist_buttons,
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        layout = wibox.layout.grid,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ 
                                position = "left", 
                                width = 20,
                                stretch = true,
                                bg = "#282c34ff",
                                fg = "#dcdfe4ff",
                                screen = s 
                            })

    -- Add widgets to the wibox
    s.mywibox:setup {
        expand = 'none',
        layout = wibox.layout.align.vertical,
        { -- Up widgets
              layout = wibox.layout.fixed.vertical,
              mylauncher,
              s.mypromptbox,
              s.mytasklist,
        },
        { -- Middle widgets
              layout = wibox.layout.fixed.vertical,
               s.mytaglist,
        },
        { -- Bottom widgets
              layout = wibox.layout.fixed.vertical,
              awful.widget.watch('zsh -c "acpi -i | grep -i remaining | cut -f2 -d ",""', 15),
              mykeyboardlayout,
              wibox.widget.systray(),
              mytextclock,
              s.mylayoutbox,
        },
    }
end)
-- }}}
