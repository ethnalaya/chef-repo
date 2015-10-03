ntp_server = search(:node,"role:ntpserver").first[:fqdn]
if node[:fqdn] != ntp_server 
  Chef::Log.info("Configuring #{node['fqdn']} as a client")
  node['ntp']['client']['packages'][node['platform']][node['platform_version']].each do |package_name,package_version|
    package package_name do
      version package_version if node['ntp']['pin_version']
      action :install
    end
  end
  
  include_recipe "ntp::service"
  
  template "update-client-configuration" do
    path node['ntp']['client']['conf_file']
    source "client.erb"
    variables(
      :ntp_server => ntp_server
    )
    sensitive true
    notifies :restart, "service[#{node['ntp']['service']['name'][node['platform']]}]", :delayed
  end
end