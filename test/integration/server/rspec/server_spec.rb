require 'json'
require 'net/http'

describe 'Dynatrace Server Performance Warehouse Configuration' do
  it 'server should should respond with correct configuration' do
    uri = URI('http://localhost:8020/rest/management/pwhconnection/config')
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Get.new(uri, {'Accept' => 'application/json'})
    request.basic_auth 'admin', 'admin'
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
