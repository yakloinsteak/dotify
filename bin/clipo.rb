#!/usr/bin/env ruby

cmd = 'parcellite -c'
last = ''
while true do
  out = `parcellite -c`
  if out != last
    print '.'
    last = out
    system("tmux setb '#{out.gsub(/'/, %<\\\'>)}'")
  end
  sleep 1
end
