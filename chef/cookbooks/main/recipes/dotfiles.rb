dotfiles = %w(
  asoundrc bashrc byebugrc caprc csshrc editrc hoerc inputrc irbrc pentadactylrc
  pryrc psqlrc rdebugrc screenrc xinitrc
)

dotfiles.each do |dotfile|
  cookbook_file "#{node['homedir']}/.#{dotfile}" do
    source dotfile
    group node['group']
    owner node['username']
    action :create_if_missing
  end
end

# TODO .xsessionrc
