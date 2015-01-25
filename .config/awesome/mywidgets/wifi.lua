wifiwidget = widget({ type = "textbox" })
vicious.register(wifiwidget, vicious.widgets.wifi, "<span foreground='orange'>${ssid}</span>", 6, 'wlan0')
