# Run from same directory as this script (as root)

sudo apt-get install -y wget chef && mkdir -p .cache && chef-solo -c ./solo.rb
