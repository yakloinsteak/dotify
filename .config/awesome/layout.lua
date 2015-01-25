layouts = {
    awful.layout.suit.tile, --1
    awful.layout.suit.tile.bottom, --2
    awful.layout.suit.spiral, --3
    awful.layout.suit.max, --4
    awful.layout.suit.max.fullscreen, --5
    awful.layout.suit.magnifier, --6
    awful.layout.suit.floating --7
}

tags = {}

-- Screen 1 (main)
tags[1] = awful.tag(
  { '1', '2', '3',
    '4', '5', '6',
    '7', '8', '9'},
  1,
  { layouts[1], layouts[1], layouts[1],
    layouts[1], layouts[1], layouts[1],
    layouts[3], layouts[1], layouts[1]
})

-- Screen 2 (to throw things into if you feel like it)
if screen.count() >= 2 then
  tags[2] = awful.tag({'bork'}, 2, {layouts[1]})
end

if screen.count() >= 3 then
  tags[3] = awful.tag({'bork'}, 2, {layouts[1]})
end
