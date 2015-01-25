#!/usr/bin/env ruby
raise "Not ready.  Please cleanup after yourself first." unless `git status` =~ /working directory clean/
system('git fetch')
system('git checkout master')
system('git merge origin/master')
system('git checkout dev')
system('git merge origin/dev')

commits = `git cherry origin/dev origin/master`.
  lines.
  map(&:chomp).
  select{|x| x =~ /^\+/ }.
  map{|x| x.sub(/^\+ /, '')}

commits.each do |commit|
  cmd = "git cherry-pick -x #{commit}"
  system(cmd)
  raise "Command `#{cmd}` failed.  Please examine" unless $?.success?
end
