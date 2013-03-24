# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.ssh.max_tries = 50
  config.ssh.timeout = 300

  config.vm.forward_port 80, 4567
  config.vm.forward_port 3306, 4568
  config.vm.forward_port 2020, 2020
  config.vm.forward_port 5000, 5000

  Vagrant::Config.run do |config|
    config.vm.share_folder("v-root", "/vagrant", ".", :extra => 'dmode=777,fmode=777')
    config.vm.provision :shell, :inline => "echo \"Europe/London\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "provision/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path = "provision/modules"
  end

end
