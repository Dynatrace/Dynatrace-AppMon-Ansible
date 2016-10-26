require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/opt/dynatrace') do
  it { should_not exist }
end

describe file('/opt/dynatrace-6.5') do
  it { should_not exist }
end

describe file '/tmp/run-dynatrace-client-installer.sh' do
  it { should_not exist }
end

