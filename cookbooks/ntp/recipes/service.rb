# Cookbook Name:: ntp
# Recipe:: services
service node['ntp']['service']['name'][node['platform']] do
  supports [:status, :restart, :start, :enable ]
  action   [:enable, :start]
end