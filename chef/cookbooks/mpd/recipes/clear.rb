file "/etc/mpd.conf" do
  action :delete
end

directory "#{node['homedir']}/.ncmpcpp" do
  recursive true
  action :delete
end
