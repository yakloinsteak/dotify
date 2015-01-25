volwidget = widget({ type = "textbox" })
vicious.register(volwidget, vicious.widgets.volume, "<span foreground='orange'>⌇</span><span foreground='green'>$1%</span>", 1, 'Master')
volwidget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("amixer -q set Master toggle", false) end),
  awful.button({ }, 3, function () awful.util.spawn("xterm -e alsamixer", true) end),
  awful.button({ }, 4, function () awful.util.spawn("amixer -q set Master 1dB+", false) end),
  awful.button({ }, 5, function () awful.util.spawn("amixer -q set Master 1dB-", false) end)
))
