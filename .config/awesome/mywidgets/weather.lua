weatherwidget = widget({ type = "textbox" })
vicious.register(weatherwidget, vicious.widgets.weather,
 function (widget, args)
   return '<span foreground="yellow">' .. args["{tempf}"] .. '°</span>'
 end, 240, 'KORH')
