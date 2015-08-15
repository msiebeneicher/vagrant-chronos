# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  #Default RAM/CPU config
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Default shared folders
  config.vm.synced_folder "salt/roots/", "/srv/", :nfs => true


  # -------------------------
  # mesos1 master server
  # -------------------------
  config.vm.define "mesos1" do |mesos1|
    #host-only networking
    mesos1.vm.network :private_network, ip: "192.168.56.101"
    mesos1.vm.hostname="mesos1"

    # workaround from: https://github.com/mitchellh/vagrant/issues/5973
    mesos1.vm.provision "shell", inline: "sudo mkdir /etc/salt"
    mesos1.vm.provision "shell", inline: "sudo cp /vagrant/salt/minion.conf /etc/salt/minion"

    # salt provider
    mesos1.vm.provision :salt do |salt|
      salt.run_highstate = true
      #salt.minion_config = "salt/minion.conf"
      salt.bootstrap_options = "-P"
      salt.verbose = true
      salt.colorize = true

      salt.pillar({
        "host" => {
          "ip" => "192.168.56.101",
          "id" => 1
        }
      })
    end

  end

end
