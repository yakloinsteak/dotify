bullet_text = require('lib/bullet_text')

local delay = 95

local default_yellow_image = bullet_text.make_image(1, 'yellow', 'Pending')
local default_green_image = bullet_text.make_image(1, 'green', '')

local conf = {
  {name = "ping NS3",
   check = function()
     cmd  = 'curl -sL -w "%{http_code}" --connect-timeout 2 www.neighborhoodscout.com/fitter_happier/site_and_database_check -o /dev/null'
     local handle = io.popen(cmd)
     local http_code = handle:read("*a")
     handle:close()

     if http_code == "200" then
       update(1, 'green')
     elseif 1==0 then
       update(1, 'orange')
     else
       update(1, 'red')
     end
   end,
   yellow_image = default_yellow_image,
   green_image = default_green_image,
   orange_image = bullet_text.make_image(1, 'orange', 'This is orange'),
   red_image = bullet_text.make_image(1, 'red', 'NS3 is down!')
  },
  {name = "animal",
   check = function()
     update(2, 'green')
   end,
   yellow_image = default_yellow_image,
   green_image = default_green_image,
   orange_image = bullet_text.make_image(2, 'orange', 'This is orange'),
   red_image = bullet_text.make_image(2, 'red', 'This is red')
  }
}
local num_indicators = table.getn(conf)

function update(offset, color)
  -- io.stderr:write("In update with an offset of " .. offset .. ". ")
  -- io.stderr:write(" using " .. devops_widgets[offset].green_image .. "\n")
  if color == 'green' then
    devops_widgets[offset].image = conf[offset].green_image
  elseif color == 'yellow' then
    devops_widgets[offset].image = conf[offset].yellow_image
  elseif color == 'orange' then
    devops_widgets[offset].image = conf[offset].orange_image
  elseif color == 'red' then
    devops_widgets[offset].image = conf[offset].red_image
  end
end

local devops_widgets = {}

for x = 1, num_indicators do
  devops_widgets[x] = widget({ type = "imagebox" })
  devops_widgets[x].image = conf[x].yellow_image

  -- widget, wtype(or function), format, interval, warg)
  vicious.register(devops_widgets[x], conf[x].check, x, delay)
end

return devops_widgets
