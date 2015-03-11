print("Entered rc.lua: " .. os.time())

require("awful")
require("awful.autofocus")
require("awful.rules")
require("naughty") -- Notification library
require("vicious")
require("beautiful")
require("rodentbane")
require('variables')

beautiful.init(theme_path)

require('layout')
require('menu')
require('task_tray')
require('mouse')
require('globalkeys')
require('client_setup')

os.execute("setxkbmap -option ctrl:nocaps")
