# Run from same directory as this script

sudo aptitude install -y ruby ruby1.8-dev build-essential wget libruby1.8 rubygems git
sudo gem update --no-rdoc --no-ri
sudo gem install ohai chef --no-rdoc --no-ri

mkdir -p .cache

chef-solo -c ./solo.rb
