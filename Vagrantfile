# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.hostname = "workstation"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
  
  config.vm.synced_folder "~",              "/vagrant/home"

  config.ssh.forward_agent = true

  # Salt Provisioner
  config.vm.provision :salt do |salt|
    salt.install_type = "stable"
    salt.bootstrap_options = '-F -c /tmp/ -P'  
    salt.masterless = true
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.verbose = true
    salt.masterless = true
    salt.colorize = true
  end
end