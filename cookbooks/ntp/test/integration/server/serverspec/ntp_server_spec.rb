require 'serverspec'

set :backend, :exec

describe package('ntp') do 
	it { should be_installed }
end

describe service('ntpd') do
	it { should be_running }
end
describe file('/etc/ntp.conf') do
	it { should be_a_file }
	it { should be_mode 644 }
end