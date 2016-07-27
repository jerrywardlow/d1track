# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
    { hostname: "app",
      box: "ubuntu/trusty64",
      config: "provision/app.sh",
      ip: "172.22.22.201",
      synchost: ".",
      syncguest: "/var/www/d1track"
    }
]

Vagrant.configure(2) do |config|
    if Vagrant.has_plugin?("vagrant-hostmanager")
      config.hostmanager.enabled = true
    end
    nodes.each do |node|
        config.vm.define node[:hostname] do |nodeconfig|
            nodeconfig.vm.provision :shell, path: node[:config], args: node[:syncguest]
            nodeconfig.vm.box = node[:box]
            nodeconfig.vm.hostname = node[:hostname]
            nodeconfig.vm.network :private_network, ip: node[:ip]
            nodeconfig.vm.synced_folder ".", "/vagrant", disabled: true
            nodeconfig.vm.synced_folder node[:synchost], node[:syncguest]

            nodeconfig.vm.provider :virtualbox do |v|
                v.name = node[:hostname]
            end
        end
    end
end
