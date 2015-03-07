require 'fileutils'
require 'yaml'

path = File.realpath(File.dirname(__FILE__))

a = YAML.load_file(File.join(path, 'runlist.yml'))
b = YAML.load_file(File.join(path, 'chef_secrets.yml'))

a.merge!(b)

File.write("#{path}/node.json", a.to_json)

file_cache_path "#{path}/.cache"
cookbook_path   path
json_attribs    "#{path}/node.json"
