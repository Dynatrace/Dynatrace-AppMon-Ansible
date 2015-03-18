require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/opt/dynatrace/server/conf/dtlicense.key') do
  it { should be_file }
  it { should be_mode 600 }
  it { should be_owned_by 'dynatrace' }
  it { should be_grouped_into 'dynatrace' }
end
