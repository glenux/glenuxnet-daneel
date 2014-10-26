# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

ROOT_DIR = File.expand_path(File.dirname(__FILE__))

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	# cache apt and gem files
	if Vagrant.has_plugin?("vagrant-cachier")
		config.cache.scope = :machine
		config.cache.auto_detect = false
		config.cache.enable :apt
		config.cache.enable :gem
	end

	# provide a common network configuration to both machines
    config.vm.provision :hosts do |provisioner|
    	provisioner.add_host '192.168.33.100', ['daneel.glenux.net']
     #	provisioner.add_host '192.168.33.101', ['other.glenux.net']
    end

    config.vm.provider :virtualbox do |vb|
		vb.gui = true
      	vb.customize ["modifyvm", :id, "--memory", 1024]
      	vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"] # Fixing DNS latency

		# problem with vt-x
		vb.cpus = 1
		vb.customize ["modifyvm", :id, "--hwvirtex", "off"] 
    end

	# provide a common provisionning configuration to both machines

  	config.vm.define "daneel", primary: true do |node|
	  	#node.vm.box = "debian_wheezy-7_3-32"
		#node.vm.box_url = "https://dl.dropboxusercontent.com/s/60pv9an852jx9y0/Debian-7.3.0-i386b.box?dl=1"

	  	#node.vm.box = "debian_jessie-8_0-amd64"
		#node.vm.box_url = "https://downloads.sourceforge.net/project/vagrantboxjessie/debian80.box"

		node.vm.box = "phusion/ubuntu-14.04-amd64"

	  	node.vm.hostname = "daneel"
      	node.vm.network :private_network, ip: "192.168.33.100"
  	  	node.vm.provision :hosts

  	  	node.vm.provision "shell", path: "provision/install.sh"
  	end
end
