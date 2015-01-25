print('Setting up client keys and behavior...')

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" }, properties = { floating = true } },
    { rule = { class = "pinentry" }, properties = { floating = true } },

    -- Terms
    { rule = { class = "XTerm" }, properties = { tag = tags[1][1] } },
    { rule = { class = "URxvt" }, properties = { tag = tags[1][1] } },
    { rule = { class = "gnome-terminal" }, properties = { tag = tags[1][1] } },

    -- Browsing
    { rule = { class = "Firefox", instance = 'Navigator' }, properties = { tag = tags[1][2] } },
    { rule = { class = "Chromium" }, properties = { tag = tags[1][2] } },

    { rule = { class = "Gitg" }, properties = { tag = tags[1][3] } },

    -- Communications
    { rule = { class = "Skype" }, properties = { tag = tags[1][4] } },
    { rule = { class = "Empathy" }, properties = { tag = tags[1][4] } },
    { rule = { class = "Pidgin" }, properties = { tag = tags[1][4] } },
    { rule = { class = "Snakefire" }, properties = { tag = tags[1][4] } },
    { rule = { class = "HipChat" }, properties = { tag = tags[1][4] } },
    { rule = { class = "Thunderbird" }, properties = { tag = tags[1][4] } },

    -- Office
    { rule = { class = "libreoffice-writer" }, properties = { tag = tags[1][5] } },
    { rule = { class = "libreoffice-calc" }, properties = { tag = tags[1][5] } },
    { rule = { class = "Libreoffice" }, properties = { tag = tags[1][5] } },
    { rule = { class = "Oosplash" }, properties = { tag = tags[1][5] } },
    { rule = { class = "Soffice.bin" }, properties = { tag = tags[1][5] } },
    { rule = { class = "VCLSalFrame.DocumentWindow" }, properties = { tag = tags[1][5] } },

    -- RSS
    { rule = { class = "Akregator" }, properties = { tag = tags[1][6] } },

    -- Graphics
    { rule = { class = "Gimp" }, properties = { floating = false, tag = tags[1][7] } },
    { rule = { class = "feh" }, properties = { floating = false, tag = tags[1][7] } },
    { rule = { class = "xpdf" }, properties = { floating = false, tag = tags[1][7] } },
    { rule = { class = "evince" }, properties = { floating = false, tag = tags[1][7] } },
    { rule = { class = "Shotwell" }, properties = { floating = false, tag = tags[1][7] } },
    { rule = { class = "Gthumb" }, properties = { floating = false, tag = tags[1][7] } },
    { rule = { class = "Dia" }, properties = { floating = false, tag = tags[1][7] } },

    -- Password
    { rule = { class = "Pasaffe" }, properties = { tag = tags[1][8] } },

    -- Virtual Machines

    { rule = { class = "VirtualBox" }, properties = { tag = tags[1][9] } }
}

-------------
-- SIGNALS --
-------------

-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they do not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

-- Hook function to execute when focusing a client.
client.add_signal("focus", function(c)
    if not awful.client.ismarked(c) then
        c.border_color = beautiful.border_focus
    end
end)

-- Hook function to execute when unfocusing a client.
client.add_signal("unfocus", function(c)
    if not awful.client.ismarked(c) then
        c.border_color = beautiful.border_normal
    end
end)
