apt_package 'ack-grep'
apt_package 'silversearcher-ag'

link '/usr/local/bin/ack' do
  to '/usr/bin/ack-grep'
end

cookbook_file "#{node['homedir']}/.ackrc" do
  source 'ackrc'
  owner node['username']
  group node['group']
end
