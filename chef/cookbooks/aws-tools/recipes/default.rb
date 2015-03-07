# TODO:add to shell rcs

directory '/usr/local/ec2'

execute  'Get zipped tools' do
  command "cd /usr/local/src && curl -O http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip"
  not_if '[[ -e /usr/local/src/ec2-api-tools.zip ]]'
end

#execute "cd /usr/local/src && unzip ec2-api-tools.zip -d /usr/local/ec2"
