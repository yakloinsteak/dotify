-- next/prev song, mpd

nextsong = widget({ type = "textbox", name = "nextsong" })
nextsong.text = "<span foreground='red'> Next»</span>"
nextsong:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("mpc next", false) end)
))

prevsong = widget({ type = "textbox", name = "prevsong" })
prevsong.text = "<span foreground='red'>«Prev </span>"
prevsong:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("mpc prev", false) end)
))
