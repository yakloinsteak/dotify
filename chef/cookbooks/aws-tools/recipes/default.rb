apt_package 'openjdk-7-jre'

directory '/usr/local/ec2'

execute  'Get zipped tools' do
  command "cd /usr/local/src && curl -O http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip"
  not_if { File.exists? '/usr/local/src/ec2-api-tools.zip' }
end

execute 'unzip aws tools. Rest is in zsh recipe' do
  command "cd /usr/local/src && unzip ec2-api-tools.zip -d /usr/local/ec2"
  not_if { system('find /usr/local/ec2 -name "ec2-describe-regions"') }
end
