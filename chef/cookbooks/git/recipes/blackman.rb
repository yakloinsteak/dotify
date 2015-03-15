dotfiles = %w(
  gitconfig gitignore gitmessage
)

dotfiles.each do |dotfile|
  template "#{node['homedir']}/.#{dotfile}" do
    source "#{dotfile}.erb"
    group node['group']
    owner node['username']
    action :create_if_missing
    variables({
      :full_name => node['full_name'],
      :email     => node['email'],
      :homeidr   => node['homedir']
    })
  end
end
