# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
    {
      hostname: "db",
      box: "ubuntu/trusty64",
      config: "provision/db.sh",
      ip: "172.22.22.202",
      synchost: "database/",
      syncguest: "/db"
    },
    {
      hostname: "app",
      box: "ubuntu/trusty64",
      config: "provision/app.sh",
      ip: "172.22.22.201",
      synchost: "application/",
      syncguest: "/tracking-app"
    }
]

Vagrant.configure(2) do |config|
  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled = true
  end
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.provision :shell, path: node[:config]
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
