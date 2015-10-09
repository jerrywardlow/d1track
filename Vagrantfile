# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.provision "shell", path: "config.sh"
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "trackbox"
  config.vm.network "private_network", type: "dhcp"
end
