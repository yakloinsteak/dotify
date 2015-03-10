#!/usr/bin/env ruby

@replacement = ARGV[0] || ''

def apply line
  puts (' ' * @start) + '#' + @replacement + " " + line[@start..-1].to_s
end

line = STDIN.gets
@start = line =~ /\S/
apply line
apply line while line = STDIN.gets
