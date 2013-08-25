# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos"

  # This can be changed to any hostname for corresponding Puppet provisioning (as on the actual server)
  # Remember to reload the VM if you change this value so that the changes takes effect.
  # Also consider destroying your box if you change this to ensure the box is properly re-provisioned from scratch.
  config.vm.hostname = "vagrant.local"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"

  #config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.options = "--verbose --debug --hiera_config=/vagrant/hiera.yaml --fileserverconfig=/vagrant/fileserver.conf"
  end
end
