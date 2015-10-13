node['vsftp']['server']['packages'][node['platform']][node['platform_version']].each do |package_name,package_version|
  package package_name do
    version package_version if node['vsftp']['pin_version']
    action :install
  end
end

if node['platform'] == 'centos'
  firewalld_service node['ntp']['firewalld']['service_name'] do
    action :add
    zone node['ethnalaya']['firewall_zone']
  end
end


include_recipe "vsftp::service"

template "vsftpd-conf" do
  path node['vsftp']['conf']['file']
  source "vsftpd.conf.erb"
  mode "0600"
  action :create
  notifies :restart, "service[#{node['vsftp']['service']['name']}]", :delayed
end