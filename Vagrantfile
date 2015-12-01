# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.hostmanager.enabled = true
    config.vm.provision "shell", path: "config.sh"
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "d1track"
    config.vm.network "private_network", ip: "172.28.128.101"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder ".", "/var/www/d1track"
    
    config.vm.provider "virtualbox" do |v|
        v.name = "d1track"
    end
end
