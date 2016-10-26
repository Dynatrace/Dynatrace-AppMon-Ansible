require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/opt/dynatrace') do
  it { should_not exist }
end

describe file('/opt/dynatrace-6.5') do
  it { should_not exist }
end

describe file '/etc/init.d/dynaTraceCollector' do
  it { should_not exist }
end

describe process('dtcollector') do
  it { should_not be_running }
end

describe service('dynaTraceCollector') do
  it { should_not be_enabled }
end
