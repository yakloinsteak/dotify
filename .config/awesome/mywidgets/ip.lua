ip_widget = widget({ type = "textbox", name = "ip_widget" })
local delay = 60

function get_ip()
  local cmd = "ifconfig  | grep 'inet addr' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d: -f2 | xargs"
  local handle = io.popen(cmd)
  ip_widget.text = "<span foreground='yellow'>" .. handle:read("*a") .. "</span>"
  handle:close()
end

mytimer = timer({ timeout = delay })
mytimer:add_signal("timeout", get_ip)
mytimer:start()

return ip_widget
