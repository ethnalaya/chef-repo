Chef::Log.info("Configuring #{node['fqdn']} as time server")
node['ntp']['server']['packages'][node['platform']][node['platform_version']].each do |package_name,package_version|
  package package_name do
    version package_version if node['ntp']['version']
    action :install
  end
end

if node['platform'] == 'centos'
  firewalld_service node['ntp']['service']['firewalld_name'] do
    action :add
    zone node['ethnalaya']['firewall_zone']
  end
end

include_recipe "ntp::service"

template "update-server-configuration" do
  path node['ntp']['server']['conf_file']
  source "server.erb"
  sensitive true
  notifies :restart, "service[#{node['ntp']['service']['name']}]", :delayed
end