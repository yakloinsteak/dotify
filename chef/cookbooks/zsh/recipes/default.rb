# Cookbook Name:: zsh with oh-my-zsh
# Recipe:: default

require 'pathname'

if node['oh_my_zsh']['users'].any?
  package "zsh"
  include_recipe "git"
end

autoloaded_functions = %w(d0 sa tmux-ard tmux-ops tmuxcolors track)
#  Pathname.
#  new(__FILE__).
#  parent.
#  join('files', 'default', 'zsh', 'func').
#  children.
#  map{|x| x.basename.to_s }

# for each listed user
node['oh_my_zsh']['users'].each do |user_hash|
  if user_hash[:home]
    home_directory = user_hash[:home]
  else
    home_directory = `cat /etc/passwd | grep "^#{user_hash[:login]}:" | cut -d ":" -f6`.chop
  end

  git "#{home_directory}/.oh-my-zsh" do
    repository node['oh_my_zsh'][:repository]
    user user_hash[:login]
    reference "master"
    action :sync
  end

  template "#{home_directory}/.zshrc" do
    source "zshrc.erb"
    owner user_hash[:login]
    mode "644"
    action :create
    variables({
      :user => user_hash[:login],
      :theme => user_hash[:theme] || 'robbyrussell',
      :case_sensitive => user_hash[:case_sensitive] || false,
      :plugins => user_hash[:plugins] || %w(git),
      :autoloads => autoloaded_functions
    })
  end

  remote_directory "#{home_directory}/.zsh" do
    source 'zsh'
    files_owner user_hash[:login]
    files_mode "644"
    files_group user_hash[:login]
    action :create_if_missing
  end

  user user_hash[:login] do
    action :modify
    shell '/bin/zsh'
  end

  if platform?("debian", "ubuntu")
    execute "source /etc/profile to all zshrc" do
      command "echo 'source /etc/profile' >> /etc/zsh/zprofile"
      not_if "grep 'source /etc/profile' /etc/zsh/zprofile"
    end
  end

end
