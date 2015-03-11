print('Setting up global keybindings...')

keynumber = 0
for s = 1, screen.count() do
  keynumber = math.min(9, math.max(#tags[s], keynumber));
end

local globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "p",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    -- awful.key({ modkey,           }, "n",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab", awful.tag.history.restore),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),

    -- bind PrintScrn to capture a screen
    -- awful.key( {}, "Print", function() awful.util.spawn("/home/blackman/bin/capscr",false) end),
    awful.key( {}, "Print", function() awful.util.spawn("scrot 'screenshots/%Y%m%d-%H:%M:%S.png' -e 'gimp $f 2>/dev/null'", false) end),

    -- Rodentbane!
    -- awful.key({ modkey,           }, "b",     function () awful.tag.incmwfact( 0.05)    end)
    awful.key({ modkey            }, "b", rodentbane.start),
    awful.key({ modkey,           }, "v", function () awful.util.spawn('xscreensaver-command --lock') end),
    awful.key({ modkey, "Shift"   }, "x", function () awful.util.spawn('xkill') end)
    --awful.key({ modkey, "Alt_L"   }, "f", function () awful.util.spawn('firefox') end)
    --awful.key({ modkey,           }, "#67", function () awful.util.spawn('/home/blackman/bin/toggle_trackpad') end) -- F1 on laptop
)

for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end)),

    -- Todd's additions. belong elsewhere?
    -- awful.key({ modkey            }, "b", rodentbane.start),
    awful.key({ modkey            }, "v", function () awful.util.spawn('xscreensaver-command -lock') end),
    awful.key({ modkey, "Alt"     }, "f", function () awful.util.spawn('firefox') end),
    awful.key( {}, "Print", function() awful.util.spawn("/home/blackman/bin/capscr",false) end),

    -- Prompt
    awful.key({modkey}, "F1", function()
        awful.prompt.run({prompt = "Run: "},
        mypromptbox[mouse.screen].widget,
        awful.util.spawn, awful.completion.shell,
        awful.util.getdir("cache") .. "/history")
        end),

    awful.key({modkey}, "F4", function()
        awful.prompt.run({prompt = "Run Lua code: "},
        mypromptbox[mouse.screen].widget,
        awful.util.eval, nil,
        awful.util.getdir("cache") .. "/history_eval")
        end)
end

musicwidget:append_global_keys()
root.keys(globalkeys)
