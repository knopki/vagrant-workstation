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
  
  # Node.js debug port
  config.vm.network "forwarded_port", guest: 5858, host: 5858

  config.vm.synced_folder "~",              "/vagrant/home"

  config.ssh.forward_agent = true

  if Vagrant::Util::Platform.windows?
    # Provisioning configuration for shell script.
    config.vm.provision "shell" do |sh|
      sh.path = "provision/windows.sh"
      sh.args = "provision/playbook.yml"
    end
  else
    # Provisioning configuration for Ansible (for Mac/Linux hosts).
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision/playbook.yml"
    end
  end
end
