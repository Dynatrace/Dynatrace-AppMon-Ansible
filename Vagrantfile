Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "startup-scripts/solaris-ansible-deps.sh"
  config.vm.define "sol1" do |subconfig|
    subconfig.vm.box = "tnarik/solaris10-minimal"
  end

  # config.vm.provision "shell", path: "startup-scripts/yum-apt-startup.sh"
  # config.vm.define "cent1" do |subconfig|
  #   subconfig.vm.box = "centos/7"
  # end
  #
  # config.vm.define "easytravel" do |subconfig|
  # config.vm.provision "shell", path: "startup-scripts/solaris-ansible-deps.sh"
  #   subconfig.vm.box = "tnarik/solaris10-minimal"
  # end
  #
  # config.vm.define "win-node" do |subconfig|
  # config.vm.box = "gusztavvargadr/windowsserver2016"
  # end

end
