default['vsftp']['pin_version']=true
##########################
#Server Attribute section
##########################
default['vsftp']['server']['packages'] ={
  'centos' => {
    '7.1.1503' => {
      'vsftpd' => '3.0.2-9.el7'
    }
  },
  'ubuntu' => {
    '14.04' => {
      'vsftpd' => '3.0.2-1ubuntu2'
    }
  }
}
case node['platform']
  when 'centos'
    default['vsftp']['conf']['base_directory']='/etc/vsftpd'
  when 'ubuntu'
    default['vsftp']['conf']['base_directory']='/etc/'
end

default['vsftp']['conf']['file']="#{node['vsftp']['conf']['base_directory']}/vsftpd.conf"

##########################
#Service Attribute section
##########################
default['vsftp']['service']['owner'] = 'root'
default['vsftp']['service']['group'] = 'root'
case node['platform']
  when 'centos'
    default['vsftp']['firewalld']['service_name'] = 'ftp'
    default['vsftp']['service']['name']  = 'vsftpd'
  when 'ubuntu'
    default['vsftp']['service']['name']  = 'vsftpd'
end
