%w( awesome awesome-extra xserver-xephyr).each do |package_name|
  apt_package package_name
end
