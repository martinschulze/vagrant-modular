# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
require_relative 'config.rb'
require_relative 'password.rb'


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "geerlingguy/ubuntu1604"

  config.vm.define VM_NAME do |virtualmachine|
  end

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "4096"]
    v.customize ["modifyvm", :id, "--vram", "128"]

    v.name = VM_NAME
    v.customize ["modifyvm", :id, "--groups", "/Coding"]
    v.gui = true
  end
  config.vm.synced_folder "./data", "/var/vagrant_data"

  config.vm.provision "shell", inline: <<-SHELL
    mkdir -p /etc/puppet
    sudo touch /etc/puppet/hiera.yaml
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
    sudo apt-get dist-upgrade -y
    echo -e "N\n" |sudo DEBIAN_FRONTEND=noninteractive apt-get install -y xubuntu-desktop
    sudo apt-get install -y -f
    sudo apt-get install -y language-pack-de-base
    sudo apt-get install -y puppet
    sudo apt-get install -y build-essential
    sudo apt-get install -y dkms
    sudo puppet module install puppetlabs-stdlib
    sudo puppet module install stm-debconf
  SHELL

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "user.pp"
    puppet.facter = {
      "username" => USERNAME,
      "fullname" => FULLNAME,
      "password_string" => PASSWORD_STRING,
      "no_ssh_config"   => NO_SSH_CONFIG
    }
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "localization_de.pp"
    puppet.module_path = "modules"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "ubuntu_1604_fixes.pp"
      puppet.facter = {
        "username" => USERNAME
      }
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "essentials.pp"
  end

  FEATURES.each do |feature|
    config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "features"
      puppet.manifest_file  = feature + ".pp"
      puppet.module_path = "modules"
      puppet.facter = {
        "username" => USERNAME
      }
    end
  end

end
