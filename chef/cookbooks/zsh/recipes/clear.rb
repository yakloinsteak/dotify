node['oh_my_zsh']['users'].each do |user_hash|
  if user_hash[:home]
    home_directory = user_hash[:home]
  else
    home_directory = `cat /etc/passwd | grep "^#{user_hash[:login]}:" | cut -d ":" -f6`.chop
  end

  directory "#{home_directory}/.zsh" do
    recursive true
    action :delete
  end

  directory "#{home_directory}/.oh-my-zsh" do
    recursive true
    action :delete
  end

  file "#{home_directory}/.zshrc" do
    action :delete
  end

end
