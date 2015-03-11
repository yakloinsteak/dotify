%w( mpc mpd ncmpcpp).each do |package_name|
  apt_package package_name
end

#mpdconfig dir
#system config dir
