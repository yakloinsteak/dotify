#sudo apt-get install caffeine

always      = %w(
  ack-grep autoconf automake bison build-essential build-essential ccache cmake
  coffeescript curl duply exif exiv2 exuberant-ctags gdal-bin git git-core gitg
  gksu gtk-recordmydesktop icedtea-7-plugin imagemagick iotop irssi kcharselect
  keychain libappindicator1 libboost-all-dev libc6-dev libcurl4-openssl-dev
  libevent-dev libffi-dev libgdbm-dev libgsasl7-dev liblapack-dev libpq-dev
  libproj-dev libqt4-core libqt4-gui libqtwebkit4 libreadline6 libreadline6-dev
  libreoffice libsasl2-dev libsqlite3-0 libsqlite3-dev libssl-dev libtool
  libv8-dev libxml2-dev libxml2-dev libxslt-dev libxslt1-dev libyaml-dev
  lsb-core mercurial monit mpc mpd mysql-client mytop ncmpcpp netpbm
  network-manager-openvpn  nodejs nodejs-dev openjdk-7-jre openssh-server
  openssl openssl openvpn pandoc parcellite pdftk perceptualdiff pgadmin3
  postgresql-client ptop pwgen python python-boto python-pip python-pygments
  python3 qrencode qt4-dev-tools r-base ranger rsync ruby-qt4-webkit rubygems
  s3cmd screen silversearcher-ag sqlite3 sqlite3 sshfs tig tint2 tmux
  traceroute tsung ubuntu-restricted-extras vim vlock whois wireshark zlib1g
  zlib1g-dev zsh
)

workstation = %w(
  thunar network-manager-openvpn-gnome autocutsel awesome awesome-extra
  chromium-browser firefox fvwm gimp gparted gthumb gufw inkscape openbox
  paprefs pidgin printer-driver-gutenprint quicksynergy scrot synergy
  terminator virtualbox virtualbox-guest-additions-iso vlc x11-xserver-utils
  xclip xdotool xfce4-power-manager xscreensaver xscreensaver-gl xsel
)

mapping     = %w( osm2pgsql osmosis postgis)
fun         = %w( frotz qgo gnugo )
gbig        = %w( freetds-dev solr-common )

# apache, mysql
servers = %w(redis-server xserver-xephyr postgresql-9.3-postgis-2.1 nginx-full passenger passenger-dev memcached)

package_to_install = always
package_to_install += workstation if workstation?
package_to_install += servers if workstation?
package_to_install += gbig

packages_to_install.each do |package_name|
  apt_package(package_name) { action(:install) }
end
