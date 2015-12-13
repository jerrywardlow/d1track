# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
    { :hostname => "d1track", :box => "ubuntu/trusty64", :config => "config.sh", :ip => "172.28.128.101", :synchost => ".", :syncguest => "/var/www/d1track"}
]

Vagrant.configure(2) do |config|
    config.hostmanager.enabled = true
    nodes.each do |node|
        config.vm.define node[:hostname] do |nodeconfig|
            nodeconfig.vm.provision :shell, path: node[:config], :args => node[:syncguest]
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
