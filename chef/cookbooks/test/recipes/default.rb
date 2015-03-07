directory "Home directory test directory" do
  path node['homedir']+'/cheftest'
  owner node['username']
  group node['group']
  mode 0755
end
