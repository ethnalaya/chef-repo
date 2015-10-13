require 'serverspec'

set :backend, :exec

describe package('ntp') do 
	it { should be_installed }
end

if os[:family] =='redhat'
	describe service('ntpd') do
		it { should be_running }
	end
elsif ['debian', 'ubuntu'].include?(os[:family])
	describe service('ntp') do
		it { should be_running }
	end
end
describe file('/etc/ntp.conf') do
	it { should be_a_file }
	it { should be_mode 644 }
end
