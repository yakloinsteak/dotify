## Add to /etc/hosts

{}.each |ipaddr,host_name| do
  execute "Append #{ipaddr} as #{host_name}" do
    command "sed -i '/#{ipaddr}/d' && echo '#{ipaddr} #{host_name}' >> /etc/hosts"
  end
end
