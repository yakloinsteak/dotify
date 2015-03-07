# caffeine
# ubuntu-restricted-extras

always = %w(
  ack-grep autoconf automake bison build-essential build-essential ccache cmake coffeescript curl
  duply exif exiv2 exuberant-ctags gdal-bin git git-core icedtea-7-plugin imagemagick iotop irssi
  keychain libappindicator1 libboost-all-dev libc6-dev libcurl4-openssl-dev libevent-dev libffi-dev
  libgdbm-dev libgsasl7-dev liblapack-dev libpq-dev libproj-dev libqt4-core libqt4-gui libqtwebkit4
  libreadline6 libreadline6-dev  libsasl2-dev libsqlite3-0 libsqlite3-dev libssl-dev libtool
  libv8-dev libxml2-dev libxml2-dev libxslt-dev libxslt1-dev libyaml-dev lsb-core mercurial monit
  mpc mpd mysql-client mytop ncmpcpp netpbm network-manager-openvpn nodejs nodejs-dev openjdk-7-jre
  openssh-server openssl openvpn pandoc pdftk perceptualdiff postgresql-client ptop pwgen python
  python-boto python-pip python-pygments python3 qrencode qt4-dev-tools r-base ranger rsync
  ruby-qt4-webkit ruby s3cmd screen silversearcher-ag sqlite3 sshfs tig tint2 tmux traceroute tsung
  vim vlock whois wireshark zlib1g zlib1g-dev zsh
)

gui_packages = %w(
  autocutsel awesome awesome-extra chromium-browser firefox fvwm gimp gitg gksu gparted gthumb
  gtk-recordmydesktop gufw inkscape kcharselect libreoffice network-manager-openvpn-gnome openbox
  paprefs parcellite pgadmin3 pidgin printer-driver-gutenprint quicksynergy scrot synergy terminator
  thunar virtualbox virtualbox-guest-additions-iso vlc x11-xserver-utils xclip xdotool
  xfce4-power-manager xscreensaver xscreensaver-gl xsel
)

mapping = %w( osm2pgsql osmosis postgis)
fun     = %w( frotz qgo gnugo )
gbig    = %w( freetds-dev solr-common )

# apache, mysql
servers = %w(
  memcached nginx-full passenger passenger-dev postgresql-9.3-postgis-2.1 xserver-xephyr
)

packages_to_install = always
packages_to_install += gui_packages if gui_packages?
#packages_to_install += servers if gui_packages?
packages_to_install += gbig

execute "apt-get update"
execute "apt-get upgrade --yes"

packages_to_install.each do |package_name|
  apt_package(package_name) { action(:install) }
end
