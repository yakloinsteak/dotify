memwidget = widget({ type = "textbox" })
vicious.register(memwidget, vicious.widgets.mem, function (widget, args)
  local color
  if args[1] < 50 then
    color = 'white'
  elseif args[1] < 70 then
    color = 'green'
  elseif args[1] < 80 then
    color = 'yellow'
  elseif args[1] < 90 then
    color = 'orange'
  else
    color = 'red'
  end
  return "<span foreground='" .. color .. "'>M:" .. args[1] .. "%</span>"
end, 13)
