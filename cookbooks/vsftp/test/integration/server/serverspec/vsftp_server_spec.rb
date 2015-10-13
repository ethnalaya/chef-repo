require 'serverspec'

set :backend, :exec

describe package('vsftpd') do 
	it { should be_installed }
end

describe service('vsftpd') do
	it { should be_running }
end
if os[:family] =='redhat'
	describe file('/etc/vsftpd/vsftpd.conf') do
		it { should be_a_file }
		it { should be_mode 600 }
	end
elsif ['debian', 'ubuntu'].include?(os[:family])
	describe file('/etc/vsftpd.conf') do
		it { should be_a_file }
		it { should be_mode 600 }
	end
end

