local bullet_text = {}

local icon_path = "/home/blackman/.config/awesome/icons"

function bullet_text.make_image(offset, color, text)
  in_file = icon_path .. '/bullet_' .. color .. '.png'
  out_file = icon_path .. '/bullet_' .. color .. '_' .. offset .. '.png'

  -- montage -background black -label ' bullet_green.png -geometry +0+0 -fill white label:'Faerie Dragon' foo.png'
  cmd = "montage -background black -label '' " .. in_file .. " -geometry +0+0 -fill white label:'" .. text .. "' " .. out_file
  io.stderr:write(cmd .. "\n")
  os.execute(cmd)

  return image(out_file)
end

return bullet_text
