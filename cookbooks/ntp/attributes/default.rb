default['ntp']['pin_version']= true
############################
## Server Attribute Section
############################
default['ntp']['server']['packages'] = {
  'centos' => {
    '7.1.1503' => {
      'ntp' => '4.2.6p5-19.el7.centos.1'
    }
  },
  'ubuntu' => {
    '14.04' => {
      'ntp' => '1:4.2.6.p5+dfsg-3ubuntu2'
    }
  }
}
default['ntp']['server']['conf_file'] = "/etc/ntp.conf"
default['ntp']['server']['timeservers'] = [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ]
default['ntp']['server']['driftfile'] = '/var/lib/ntp/ntp.drift'
default['ntp']['server']['logfile'] = '/var/log/ntp.log'
############################
## Service Attribute Section
############################
default['ntp']['service']['owner'] = 'root'
default['ntp']['service']['group'] = 'root'
case node['platform']
  when 'centos'
    default['ntp']['service']['firewalld_name'] = 'ntp'
    default['ntp']['service']['name']  = 'ntpd'
  when 'ubuntu'
    default['ntp']['service']['name']  = 'ntp'
end
############################
## Client Attribute Section
############################
default['ntp']['client']['packages'] = {
  'centos' => {
    '6.6' => {
      'ntp' => '4.2.6p5-1.el6.centos',
      'ntpdate' => '4.2.6p5-1.el6.centos'
    },
    '7.1.1503' => {
      'ntp' => '4.2.6p5-19.el7.centos.1'
    }
  },
  'ubuntu' => {
    '14.04' => {
      'ntp' => '1:4.2.6.p5+dfsg-3ubuntu2'
    }
  }
}
default['ntp']['client']['conf_file'] = "/etc/ntp.conf"
default['ntp']['client']['driftfile'] = '/var/lib/ntp/ntp.drift'
default['ntp']['client']['logfile'] = '/var/log/ntp.log'
