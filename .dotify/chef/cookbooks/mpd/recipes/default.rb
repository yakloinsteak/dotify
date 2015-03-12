%w( mpc mpd ncmpcpp pulseaudio paman).each do |package_name|
  apt_package package_name
end

directory "#{node['homedir']}/Music" do
  owner node['username']
  group node['group']
end

template "/etc/mpd.conf" do
  source "mpd_conf.erb"
  mode "644"
  action :create #_if_missing
  variables({
     :homedir => node['homedir'],
     :username => node['username']
  })
end

directory "#{node['homedir']}/.ncmpcpp" do
  owner node['username']
  group node['group']
end

template "#{node['homedir']}/.ncmpcpp/config" do
  source 'config.erb'
  owner node['username']
  group node['group']
  variables({
     :homedir => node['homedir'],
     :username => node['username']
  })
end

%w(pulse pulse-access).each do |group_name|
  group group_name do
    action :modify
    members node['username']
    append true
  end
end

service "mpd" do
  action :start
end
