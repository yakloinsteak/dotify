#execute 'aptitude update'
# Refactor Xorg into its own recipe

apt_package 'lightdm'
#apt_package 'openbox'
#apt_package 'xserver-xorg-video-all'
#apt_package 'terminator'
apt_package 'ubuntu-desktop'

template '/etc/lightdm/lightdm.conf' do
  source 'lightdm_conf.erb'
  variables({
    :username =>  node['username'],
    :default_manager => 'awesome'
  })
end

#service 'lightdm' do
#  action :restart
#end


%w( awesome awesome-extra xserver-xephyr pam-kwallet ).each do |package_name|
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
