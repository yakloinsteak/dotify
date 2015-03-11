apt_package 'tmux'
apt_package 'xclip'

cookbook_file "#{node['homedir']}/.tmux.conf" do
  backup 1
  owner node['username']
  group node['group']
  mode 0644
  source "tmux.conf"
end

cookbook_file "#{node['homedir']}/.tmux_colors.sh" do
  backup 1
  owner node['username']
  group node['group']
  mode 0644
  source "tmux_colors.sh"
end

cookbook_file "#{node['homedir']}/.tmux_ips.sh" do
  backup 1
  owner node['username']
  group node['group']
  mode 0644
  source "tmux_ips.sh"
end
