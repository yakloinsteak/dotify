#!/usr/bin/env ruby

while line = gets
  puts line.gsub(/:(\w+)\s+=>/, '\1:')
end
