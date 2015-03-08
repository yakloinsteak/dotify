require 'fileutils'
require 'yaml'

roles = Dir.
  glob('roles/*.rb').
  map{|x| x.split('/').last }.
  map{|x| x.split('.').first }

role = ""
while !roles.include?(role) do
  print "Enter a role (#{roles}): "
  role = STDIN.gets
  role.chomp!
end

path = File.realpath(File.dirname(__FILE__))

#a = YAML.load_file(File.join(path, 'runlist.yml'))
chef_secrets = YAML.load_file(File.join(path, 'chef_secrets.yml'))

chef_secrets['run_list'] = [
  "role[#{role}]"
]

File.write("#{path}/node.json", chef_secrets.to_json)

file_cache_path  "#{path}/.cache"
cookbook_path    "#{path}/cookbooks"
json_attribs     "#{path}/node.json"
role_path        "#{path}/roles"
