theme_path = "/home/blackman/.config/awesome/themes/toddburn/theme.lua"
browser = "firefox -P default"
mail = "thunderbird"

hostname = os.getenv("HOST") or "unknown"
print("Using hostname of "..hostname)

terminal = "terminator"
print("Using terminal of "..terminal)

editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
