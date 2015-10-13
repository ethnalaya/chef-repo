service node['vsftp']['service']['name'] do
  supports [:start, :restart, :reload, :enable]
  action [:enable, :start]
end