print('Loading menu...')

local sysmenu = {
  { "shutdown", "/usr/bin/gksudo 'shutdown -h now'"},
  { "reboot", "/usr/bin/gksudo 'shutdown -r now'"},
  { "hibernate", "/usr/bin/gksudo 'pm-hibernate'"},
  { "logout", awesome.quit }
}

local audio = {
  { "Pulse Control", 'pavucontrol'},
  { "Music", "tmux new-window -k -t ops -n 'music' 'ncmpcpp'" },
  { "GMPC", "gmpc" },
  { "gtk-recordmydesktop", 'gtk-recordmydesktop'}
}

local chat = {
  { "Pidgin", 'pidgin'},
  { "Chat", 'empathy'},
  { "finch", 'finch'},
  { "Snakefire", 'snakefire'},
  { "Skype", 'skype'}
}

local graphics = {
  { "Picker", 'gpick'},
  { "Shotwell", 'shotwell'},
  { "F-spot", 'f-spot'},
  { "Darktable", 'darktable'},
  { "Gwenview", 'gwenview'},
  { "Gthumb", 'gthumb'},
  { "Gimp", 'gimp'}
  -- { "feh", 'feh'}
}

local gis = {
  { "qgis", 'qgis'}
}

local misc = {
  { "Chat", chat},
  { "Graphics", graphics},
  { "Virtualbox", 'VirtualBox'},
  { "Power Manager", "xfce4-power-manager"},
  { "reload awesome", awesome.restart },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", "tmux new-window -k -t ops -n 'rc.lua' 'vim /home/blackman/.config/awesome/rc.lua'" },
  { "Aptitude", "tmux new-window -k -t ops -n 'aptitude' 'sudo aptitude'" },
  { "partition", "/usr/bin/gksudo 'gparted'"},
  { "firewall", "/usr/bin/gksudo 'gufw'"},
  { "wireshark", '/usr/bin/gksudo "wireshark"'},
  { "X Properites", 'urxvt -e xprop'},
  { "Update", '/usr/bin/gksudo update-manager'},
  { "Synaptic", '/usr/bin/gksudo "synaptic"'},
  { "Timezone", '/usr/bin/gksudo "terminator -x dpkg-reconfigure tzdata"'},
  { "Throughput", '/usr/bin/gksudo "ntm"'},
  { "Disk Utility", '/usr/bin/gksudo "palimpsest"'},
  { "Upgrade", 'terminator --execute sudo apt-get upgrade \&\& sleep 10'},
  { "Nautilus", 'nautilus --no-desktop'}
}

local circuits = {
  { "Easy Spice", 'easy_spice'}
}

mymainmenu = awful.menu({ items = {
  { "System", sysmenu, beautiful.awesome_icon },
  { "Audio/Video", audio},
  { "Misc", misc},
  { "GIS", gis},
  { "Circuits", circuits},
  { "Windows", 'virtualbox --startvm "Windows 7"'},
  { "Crunch", 'virtualbox --startvm "Crunchbang"'},
  { "Firefox", 'firefox'},
  { "Chrome", 'chromium-browser'}
}})

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = mymainmenu})
