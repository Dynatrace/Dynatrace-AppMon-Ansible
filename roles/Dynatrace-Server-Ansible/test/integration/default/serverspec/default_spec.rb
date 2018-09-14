require 'json'
require 'net/http'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe command('java -version'), :if => os[:family] == 'redhat' do
  its(:stdout) { should match /1.8.0_181/ }
end

describe command('java -version'), :if => os[:family] == 'ubuntu' do
  its(:stdout) { should match /1.8.0_181/ }
end

describe user('dynatrace') do
  it { should exist }
  it { should belong_to_group 'dynatrace' }
end

describe file('/opt/dynatrace') do
  it { should be_directory }
  it { should be_symlink }
end

describe file ('/etc/init.d/dynaTraceServer') do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }

  if os[:family] == 'debian' || os[:family] == 'ubuntu'
    its(:content) { should match /^\# Default-Start: 2 3 4 5$/ }
    its(:content) { should match /^\# Default-Stop: 0 1 6$/ }
  elsif os[:family] == 'redhat'
    its(:content) { should match /^\# Default-Start: 3 5$/ }
    its(:content) { should match /^\# Default-Stop: 0 1 2 6$/ }
  end

  its(:content) { should match /^DT_HOME=\/opt\/dynatrace$/ }
  its(:content) { should match /^DT_OPTARGS="-listen 9998"$/ }
  its(:content) { should match /^DT_RUNASUSER=dynatrace/ }
end

describe process('dtfrontendserver') do
  it { should be_running }
  its(:user) { should eq 'dynatrace' }
end

describe process('dtserver') do
  it { should be_running }
  its(:user) { should eq 'dynatrace' }
  its(:args) { should match /-listen 9998/ }
end

describe service('dynaTraceServer') do
  it { should be_enabled }

  if os[:family] == 'debian' || os[:family] == 'ubuntu'
      it { should be_enabled.with_level(3) }
      it { should be_enabled.with_level(4) }
      it { should be_enabled.with_level(5) }
  end
end

describe port(2021) do
  it { should be_listening }
end

describe port(6699) do
  it { should be_listening }
end

describe port(8021) do
  it { should be_listening }
end

describe port(9911) do
  it { should be_listening }
end

describe 'Dynatrace Server Performance Warehouse Configuration' do
  it 'server should should respond with correct configuration' do
    uri = URI('http://localhost:8021/rest/management/pwhconnection/config')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri, {'Accept' => 'application/json', 'Content-Type' => 'application/json'})
    request.basic_auth('admin', 'admin')
    response = http.request(request)

    expect(response.code).to eq('200')

    data = JSON.parse(response.body)
    expect(data['pwhconnectionconfiguration']['host']).to eq('localhost')
    expect(data['pwhconnectionconfiguration']['port']).to eq('5432')
    expect(data['pwhconnectionconfiguration']['dbms']).to eq('postgresql')
    expect(data['pwhconnectionconfiguration']['dbname']).to eq('dynatrace-pwh')
    expect(data['pwhconnectionconfiguration']['user']).to eq('dynatrace')
    expect(data['pwhconnectionconfiguration']['password']).to eq('*********')
    expect(data['pwhconnectionconfiguration']['usessl']).to eq(false)
  end
end
