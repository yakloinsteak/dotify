%w( mpc mpd ncmpcpp).each do |package_name|
  apt_package package_name
end

template "/etc/mpd.conf" do
  source "mpd_confg.erb"
  #owner user_hash[:login]
  mode "644"
  action :create #_if_missing
  variables({
     :basedir => node['homedir'],
     :username => node['username']
  })
end

directory "#{node['homedir']}/.mpd" do
  owner node['username']
  group node['group']
end
