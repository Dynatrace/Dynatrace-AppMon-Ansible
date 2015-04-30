require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/tmp/environment') do
  its(:content) { should match /^export CATALINA_OPTS="\$CATALINA_OPTS -agentpath:\/opt\/dynatrace\/agent\/lib64\/libdtagent.so=name=apache-tomcat-agent,collector=localhost:9998"$/ }
end
