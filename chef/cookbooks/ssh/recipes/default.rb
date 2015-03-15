apt_package 'ssh'
#apt_package 'openssh-client'

directory "#{node['homedir']}/.ssh" do
  group node['group']
  user node['username']
  mode '0700'
end

template "#{node['homedir']}/.ssh/config" do
  source 'config.erb'
  group node['group']
  user node['username']
  mode '0600'
end

file "#{node['homedir']}/.ssh/authorized_keys2" do
  content node['ssh']['authorized_keys'].join("\n")
  group node['group']
  user node['username']
  mode '0600'
  action :create_if_missing
end
