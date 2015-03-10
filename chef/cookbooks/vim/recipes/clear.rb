file "#{node['homedir']}/.vimrc" do
  action :delete
end

file "#{node['homedir']}/.gvimrc" do
  action :delete
end

directory "#{node['homedir']}/.vim" do
  recursive true
  action :delete
end
