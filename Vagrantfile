# -*- mode: ruby -*-
# vi: set ft=ruby :
IMAGE_NAME = "bento/ubuntu-16.04"
MasterCount = 1
NodeCount = 2
IP_PUB = "192.168.88.18" #*
IP_PRV = "10.0.38.18" #*
IP_PUB2 = "192.168.88.19" #*
IP_PRV2 = "10.0.38.19" #*
NETWORK = "public_network"
ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"
  # Kubernetes Master Server
  (1..MasterCount).each do |i|
    config.vm.define "kmaster0#{i}" do |kmaster|
      kmaster.vm.box = IMAGE_NAME
      kmaster.vm.hostname = "kmaster0#{i}"
      if IP_PUB != "" then
        kmaster.vm.network NETWORK, ip: "#{IP_PUB}#{i}"
      end
      if  IP_PRV != "" then
        kmaster.vm.network "private_network", ip: "#{IP_PRV}#{i}"
      end
      kmaster.vm.provider "virtualbox" do |v|
        v.name = "kmaster0#{i}"
        v.memory = 2048
        v.cpus = 2
      end
    end
  end


  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "kworker0#{i}" do |workernode|
      workernode.vm.box = IMAGE_NAME
      workernode.vm.hostname = "kworker0#{i}"
      if IP_PUB2 != "" then
        workernode.vm.network NETWORK, ip: "#{IP_PUB2}#{i}"
      end
      if  IP_PRV2 != "" then
        workernode.vm.network "private_network", ip: "#{IP_PRV2}#{i}"
      end
      workernode.vm.provider "virtualbox" do |v|
        v.name = "kworker0#{i}"
        v.memory = 2048
        v.cpus = 1
      end
    end
  end

end
