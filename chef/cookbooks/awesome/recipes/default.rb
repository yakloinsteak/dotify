%w( awesome awesome-extra xserver-xephyr).each do |package_name|
  apt_package package_name
end

remote_directory "#{node['homedir']}/.config/awesome" do
  source 'awesome'
  files_owner node['username']
  files_mode "644"
  files_group node['username']
  group node['group']
  owner node['username']
  action :create #_if_missing
end

