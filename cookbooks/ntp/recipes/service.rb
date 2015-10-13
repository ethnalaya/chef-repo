# Cookbook Name:: ntp
# Recipe:: services

service node['ntp']['service']['name'] do
  supports [:status, :restart, :start, :enable ]
  action   [:enable, :start]
end