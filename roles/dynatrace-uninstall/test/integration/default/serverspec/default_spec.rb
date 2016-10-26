require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/opt/dynatrace') do
  it { should_not exist }
end

describe file '/etc/init.d/dynaTraceServer' do 
  it { should_not exist }
end

describe process('dtfrontendserver') do
  it { should_not be_running }
end

describe process('dtserver') do
  it { should_not be_running }
end

describe service('dynaTraceServer') do
  it { should_not be_enabled }
end
