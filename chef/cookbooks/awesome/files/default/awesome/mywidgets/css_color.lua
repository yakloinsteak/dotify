css_color = widget({ type = "textbox", name = "css_color" })

function adjust(data)
  -- naughty.notify({text = data[1]})
  css_color.text = "<span foreground='" .. data[1] .. "' background='" .. data[2] .. "'>" .. data[1] .. " on ".. data[2].. "</span>"
end

os.execute('touch /tmp/css.dat')
bashets.register('/tmp/css.dat', {widget = css_color, update_time = 2, external = false, callback = adjust, read_file = true})

-- Garbage
-- local name = "css_color.rb"
--   css_color.text = "<span foreground='" .. data[1] .. "' background='" .. data[2] .. "'>" .. data[1] .. "</span> <span background='" .. data[1] .. "' foreground='" .. data[2] .. "'>" .. data[1] .. "</span>"
-- bashets.register(name, {widget = css_color, update_time = 2, external = false, updater = name, format = "<span color='$1'>Hello yup up.</span>"})
-- bashets.register(name, {widget = css_color, update_time = 2, external = false, updater = name, callback = adjust})
