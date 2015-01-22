require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/tmp/environment') do
  it { should be_file }
  its(:content) { should match /^export JAVA_OPTS="\$JAVA_OPTS -agentpath:\/opt\/dynatrace\/agent\/lib64\/libdtagent.so=name=java-agent,collector=localhost:9998"$/ }
end
