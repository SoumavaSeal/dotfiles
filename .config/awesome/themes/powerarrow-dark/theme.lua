--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark"
theme.wallpaper                                 = theme.dir .. "/wall1.png"
--theme.wallpaper                                 = "~/Pictures/paisaje.jpg"
theme.font                                      = "CascadiaMono 10"
-- Gruvbox Theme
theme.fg_normal                                 = "#EBDBB2"
theme.fg_focus                                  = "#EA6F81"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#3C3836"
theme.bg_focus                                  = "#282828"
theme.bg_urgent                                 = "#1A1A1A"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#7F7F7F"
theme.border_marked                             = "#CC9393"
theme.tasklist_bg_focus                         = "#1A1A1A"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(5)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- Tag Icons
theme.tag_icon_chrome                           = theme.dir .. "/icons/panel/chrome.svg"
theme.tag_icon_coding                           = theme.dir .. "/icons/panel/code-braces.png"
theme.tag_icon_video                            = theme.dir .. "/icons/panel/music.png"
theme.tag_icon_folder                           = theme.dir .. "/icons/panel/folder.svg"
theme.tag_icon_console                          = theme.dir .. "/icons/panel/console.svg"


-- Widgets
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local logout_popup = require("awesome-wm-widgets.logout-popup-widget.logout-popup")

local markup = lain.util.markup
local separators = lain.util.separators

local keyboardlayout = awful.widget.keyboardlayout:new()

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

--Custom Clock
mytextclock = wibox.widget{
   {
      {
         widget = wibox.widget.textclock("<span font='DejavuMono 12'><b>%H\n%M</b></span>"),
      },
      halign = 'center',
      widget = wibox.container.place(),
   },
   bg = "#282828",
   forced_width = dpi(35),
   forced_height = dpi(60),
   widget = wibox.container.background,
}

--Custom Systray
local systray = wibox.widget{
   {
      forced_height = 10,
      widget = wibox.widget.systray,
   },
   margins = 4,
   widget = wibox.container.margin  
} 

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Mail IMAP check
local mailicon = wibox.widget.imagebox(theme.widget_mail)
--[[ commented because it needs to be set before use
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_markup(markup.font(theme.font, " " .. mailcount .. " "))
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--]]

-- MPD
local musicplr = awful.util.terminal .. " -title Music -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ "Mod4" }, 1, function () awful.spawn(musicplr) end),
    awful.button({ }, 1, function ()
        os.execute("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        os.execute("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
        os.execute("mpc next")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(theme.widget_music)
        end

        widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})
--]]

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                baticon:set_image(theme.widget_ac)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_ac)
        end
    end
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end

        widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
    end
})
theme.volume.widget:buttons(awful.util.table.join(
                               awful.button({}, 4, function ()
                                     awful.util.spawn("amixer set Master 1%+")
                                     theme.volume.update()
                               end),
                               awful.button({}, 5, function ()
                                     awful.util.spawn("amixer set Master 1%-")
                                     theme.volume.update()
                               end)
))

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font,
                          markup("#7AC82E", " " .. string.format("%06.1f", net_now.received))
                          .. " " ..
                          markup("#46A8C3", " " .. string.format("%06.1f", net_now.sent) .. " ")))
    end
})

-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)


-- Menu Icon
local menu = wibox.widget{
    {
        text = "  ",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox,
        font = "FontAwesome 15",
    },
    left = 4,
    widget = wibox.container.margin 
}

menu:connect_signal("button::press", function()
    awful.spawn("rofi -show drun")
end)


function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    
    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

-------------------------------------------------------------------
-- Changes Made Soumava
-------------------------------------------------------------------

--    local tags = {
--       theme.tag_icon_chrome,
--       theme.tag_icon_coding,
--       theme.tag_icon_video,
--       theme.tag_icon_folder,
--       theme.tag_icon_console,
--    }
    
--    awful.screen.connect_for_each_screen(
--        function(s)
--            for i, tag in pairs(tags) do
--                awful.tag.add(
--                    i,
--                    {
--                       icon = tag,
--                        icon_only = true,
--                        screen =s,
--                        layout = awful.layout.layouts[1],
--                        selected = i == 1
--                    }
--                )
--            end
--        end
--    )

-------------------------------------------------------------------
-- End Changes.
-------------------------------------------------------------------

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    -- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
    
    s.mytaglist = awful.widget.taglist{
        screen = s,
        buttons = awful.util.taglist_buttons,
        filter = awful.widget.taglist.filter.all,
        style = {
            spacing = 15,
            font = "FontAwesome 15" 
        },
        
        layout = {
            layout = wibox.layout.fixed.vertical
        },
        widget_template = {
            {
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.vertical,
            },
            top = 25,
            left = 6,
            widget = wibox.container.margin
        }
    }

    -- Create a tasklist widget
    
    local common = require("awful.widget.common")
    
    -------------------------------------------------------------------------------------------------------
    -- Implement the list_update function to achieve the following:
    -- 		1. Truncate the title when the text is too long.
    -- 		2. Set the maximum width of each tile in the tasklist.
    --Reference: https://github.com/awesomeWM/awesome/issues/1793 for the list_update Function
    -------------------------------------------------------------------------------------------------------

    function list_update(w, buttons, label, data, objects)

       w:reset()

       for i, o in ipairs(objects) do

          local cache = data[o]
          local ib, tb, bgb, tbm, ibm, l

          if cache then
             ib = cache.ib
             tb = cache.tb
             bgb = cache.bgb
             tbm = cache.tbm
             ibm = cache.ibm
          else
             ib = wibox.widget.imagebox()
             tb = wibox.widget.textbox()
             bgb = wibox.container.background()
             tbm = wibox.container.margin(tb, dpi(4), dpi(4))
             ibm = wibox.container.margin(ib, dpi(4))
             l = wibox.layout.fixed.horizontal()

             -- All of this is added in a fixed widget
             l:fill_space(true)
             l:add(ibm)
             l:add(tbm)
 
             -- And all of this gets a background
             bgb:set_widget(l)
 
             bgb:buttons(common.create_buttons(buttons, o))
 
             data[o] = {
                 ib  = ib,
                 tb  = tb,
                 bgb = bgb,
                 tbm = tbm,
                 ibm = ibm,
             }
          end
          
         local text, bg, bg_image, icon, args = label(o, tb)
         args = args or {}
 
         -- The text might be invalid, so use pcall.
         if text == nil or text == "" then
             tbm:set_margins(0)
         else
             -- Truncate when the title is too long.
             -- Reference: https://github.com/ChrisTitusTech/titus-awesome/blob/main/widget/task-list.lua --> from line 125
             
             local textOnly = text:match('>(.-)<')

             if(textOnly:len() > 15) then
                 text = text:gsub('>(.-)<', '>' .. textOnly:sub(1, 15) .. '...<')
             end
             
             if not tb:set_markup_silently(text) then
                 tb:set_markup("<i>&lt;Invalid text&gt;</i>")
             end
         end
         bgb:set_bg(bg)
         if type(bg_image) == "function" then
             -- TODO: Why does this pass nil as an argument?
             bg_image = bg_image(tb,o,nil,objects,i)
         end
         bgb:set_bgimage(bg_image)
         if icon then
             ib:set_image(icon)
         else
            ibm:set_margins(0)
         end
 
         bgb.shape              = args.shape
         bgb.shape_border_width = args.shape_border_width
         bgb.shape_border_color = args.shape_border_color

        w:add(bgb)
          
       end

       -- Set the width of each title in the tasklist.
       -- Reference: https://stackoverflow.com/questions/31293571/awesome-wm-setting-size-for-the-tasklist-item
       
       w:set_max_widget_size(200)
       
    end

    
    -------------------------------------------------------------------------------------------------------
    -- End List_update implementation.
    -------------------------------------------------------------------------------------------------------

    
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = awful.util.tasklist_buttons,
        update_function = list_update,
        style    = {
            align = 'center',
            shape_border_width = 1,
            shape_border_color = '#777777',
            shape  = gears.shape.rounded_bar,
        },
        layout   = {
            spacing = 20,
            spacing_widget = {
                {
                    forced_width = 5,
                    shape        = gears.shape.circle,
                    widget       = wibox.widget.separator
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            layout  = wibox.layout.flex.horizontal()
        },
        widget_template = {
            {
                  {
                     {
                        {
                              id     = 'icon_role',
                              widget = wibox.widget.imagebox,
                        },
                        
                        margins = 2,
                        widget  = wibox.container.margin,
                     },
                     {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                     },
                     layout = wibox.layout.fixed.horizontal,
                  },
                  left  = 10,
                  right = 10,
                  widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        }
    }

    -- Create the wibox
    s.topPanel = awful.wibar({
        position = "top",
        screen = s, 
        height = dpi(35), 
        bg = theme.bg_normal,
        fg = theme.fg_normal 
    })

    -- Add widgets to the wibox
    s.topPanel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            menu,
            spr,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            volicon,
            theme.volume.widget,
            arrl_ld,
            arrl_dl,
            cpu_widget(),
            arr1_ld,
            arrl_dl,
            --memicon,
            --mem.widget,
            ram_widget(),            
            arrl_ld,
            --wibox.container.background(cpuicon, theme.bg_focus),
            --wibox.container.background(cpu.widget, theme.bg_focus),
            arrl_dl,
            --tempicon,
            --temp.widget,
            --arrl_ld,
           -- wibox.container.background(fsicon, theme.bg_focus),
           -- wibox.container.background(theme.fs.widget, theme.bg_focus),
            --arrl_dl,
            baticon,
            bat.widget,
            arrl_ld,
            wibox.container.background(neticon, theme.bg_focus),
            wibox.container.background(net.widget, theme.bg_focus),
            arrl_dl,
            clock,
            spr,
            arrl_ld,
            systray,
            --wibox.widget.systray(),
            wibox.container.background(s.mylayoutbox, theme.bg_focus),
        },
    }
    
    s.leftPanel = awful.wibar({
        position = "left",
        screen = s,
        width = dpi(35), 
        bg = "#3c3836", 
        fg = "#ebdbb2" 
    })

    s.leftPanel:setup {
        layout = wibox.layout.align.vertical,
        { -- Left widgets
            layout = wibox.layout.fixed.vertical,
            s.mytaglist,
        },
        nil, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.vertical,
            wibox.container.place(mytextclock, {halign = 'center'}),
            wibox.container.place(logout_popup.widget{}, {halign = 'center'}),
            spr,
            spacing = 30,
--            require('widget.brightness')
         --   wibox.container.background(s.mylayoutbox, theme.bg_focus),
        },
        
    }

end
return theme
