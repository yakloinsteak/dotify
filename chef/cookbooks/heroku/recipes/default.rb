execute 'Heroku Toolbelt' do
  command 'wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh'
  not_if {  File.exists? '/usr/bin/heroku' }
end
