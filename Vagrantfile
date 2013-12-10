# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure('2') do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.hostname = 'chefrails'
  config.vm.network 'forwarded_port', guest: 80, host: 8080
  config.vm.network "private_network", ip: "10.11.12.13"
end
