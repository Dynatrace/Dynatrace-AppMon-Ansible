Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "startup-scripts/solaris-ansible-deps.sh"
  config.vm.define "ansible-node" do |subconfig|
    subconfig.vm.box = "haxyione/solaris10"
  end

  config.vm.define "easytravel" do |subconfig|
  config.vm.provision "shell", path: "startup-scripts/solaris-ansible-deps.sh"
    subconfig.vm.box = "haxyione/solaris10"
  end
end
