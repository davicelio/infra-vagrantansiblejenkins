# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

unless Vagrant.has_plugin?("vagrant-hostmanager")
  raise 'vagrant-hostmanager plugin is required'
end

Vagrant.configure(2) do |config|
    if Vagrant.has_plugin?("vagrant-timezone")
		config.timezone.value = "Europe/Madrid"
    end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  config.vm.box = "centos/8"
  #config.vm.box_version = "17.11.24"
  #config.vm.boot_timeout = "3600"
  config.vm.provider "ansible" do |vbox, override|
    vbox.memory = 1024
    vbox.cpus = 1
  	vbox.customize ["modifyvm", :id, "--usb", "on"]
  	vbox.customize ["modifyvm", :id, "--usbehci", "off"]
  	vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  	
  end
  # other global configuration
  # ahora configuramos el plugin vbguest
  if Vagrant.has_plugin?("vagrant-vbguest")
   config.vbguest.auto_update = false
   config.vbguest.no_remote = true
  end
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

      config.vm.box_check_update = false
      config.vm.hostname = "ansible"
      config.vm.network "private_network", ip: "192.168.50.0"

      config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
      config.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true

      config.vm.provision "shell", path: "./scripts/init.sh"
      config.vm.provision "shell", path: "./scripts/install_ansible.sh"
	  end

end
