cookbook_file 'vimrc' do
  path node['homedir']+'/.vimrc'
  action :create_if_missing
end

cookbook_file 'gvimrc' do
  path node['homedir']+'/.gvimrc'
  action :create_if_missing
end