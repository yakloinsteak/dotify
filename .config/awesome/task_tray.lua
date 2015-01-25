require('ampd') -- mpd widget
require("bashets")

mytextclock = awful.widget.textclock({align = "right"})

local spacer = widget({ type = "textbox", name = "spacer" })
local separator = widget({ type = "textbox", name = "separator" })
spacer.text = " "
separator.text = " <span foreground='red'>•</span> "

require('mywidgets/memory')

local cpuwidget = widget({ type = "textbox" })
vicious.register(cpuwidget, vicious.widgets.cpu, "<span foreground='orange'>load: </span><span foreground='green'>$1%</span>")

-- local batwidget = widget({ type = "textbox" })
-- vicious.register(batwidget, vicious.widgets.bat, "<span foreground='orange'>bat: </span><span foreground='green'>$1$2%</span>", 60, "BAT0")

ip_widget = require('mywidgets/ip')
require('mywidgets/date')
require('mywidgets/weather')
require('mywidgets/volume')
require('mywidgets/prev_next')
require('mywidgets/wifi')
devops_widgets = require('mywidgets/devops')

bashets.set_script_path("/home/blackman/.config/awesome/bashets/")
-- require('mywidgets/css_color')
bashets.start()

-- Create a systray
mysystray = widget({type = "systray", align = "right"})

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
    awful.button({}, 1, awful.tag.viewonly),
    awful.button({modkey}, 1, awful.client.movetotag),
    awful.button({}, 3, function(tag) tag.selected = not tag.selected end),
    awful.button({modkey}, 3, awful.client.toggletag),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
    )

mytasklist = {}
mytasklist.buttons = awful.util.table.join(
    awful.button({}, 1, function(c)
        if not c:isvisible() then
            awful.tag.viewonly(c:tags()[1])
        end
        client.focus = c
        c:raise()
        end),
    awful.button({}, 3, function()
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({width=250})
        end
        end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
        if client.focus then client.focus:raise() end
        end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
        end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({layout = awful.widget.layout.leftright})
    -- Create an imagebox widget which will contains an icon indicating which
    -- layout we're using.  We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
            awful.button({}, 1, function() awful.layout.inc(layouts, 1) end),
            awful.button({}, 3, function() awful.layout.inc(layouts, -1) end),
            awful.button({}, 4, function() awful.layout.inc(layouts, 1) end),
            awful.button({}, 5, function() awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist.new(s,
                                            awful.widget.taglist.label.all,
                                            mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist.new(function(c)
                        return awful.widget.tasklist.label.currenttags(c, s)
                    end,
                    mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({position = "top", screen = s})
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        layout = awful.widget.layout.horizontal.rightleft,
        mylayoutbox[s],
        s == 1 and mysystray or nil,
        separator, memwidget,
        separator, cpuwidget,
        separator, datewidget,
        separator, ip_widget,
        separator, volwidget,
        separator, nextsong,
        musicwidget.widget,
        prevsong,
        separator, weatherwidget,
        -- separator, css_color,
        separator,
          devops_widgets[1],
          devops_widgets[2],
        mytasklist[s]
      }


    -- table.insert(mywibox[s].widgets, mytasklist[s])

    mywibox[s].screen = s
end
