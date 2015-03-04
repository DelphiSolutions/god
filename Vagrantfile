# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'ruby-god'

  case ENV['UBUNTU_VERSION']
  when '12.04'
    config.vm.box = 'ubuntu-12.04-2015-02-18'
    config.vm.box_url = 'https://s3-us-west-1.amazonaws.com/delphi-vagrant/ubuntu/12.04/og-precise-server-2015-02-18.box'

  else
    config.vm.box = 'ubuntu-14.04-2015-02-18'
    config.vm.box_url = 'https://s3-us-west-1.amazonaws.com/delphi-vagrant/ubuntu/14.04/og-trusty-server-2015-02-18.box'
  end

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. Specs are similar to AWS m1.small instance type
    vb.customize ['modifyvm', :id, '--memory', '1048']
    vb.customize ['modifyvm', :id, '--cpus', '1']
  end

  if ENV['ENABLE_PUBLIC_NETWORK']
    config.vm.network :public_network
  else
    config.vm.network :private_network, ip: '10.13.37.25'
  end

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # If you want provision without the chef server
  config.vm.provision :chef_zero do |chef|
    chef.version = '11.16.4'
    chef.install = true

    chef.log_level = ENV['CHEF_LOG_LEVEL'] || 'info'

    chef.environment = ENV['CHEF_ENV'] || 'development'
    chef.environments_path = ENV['CHEF_ENVIRONMENTS'] || '../../environments'
    chef.data_bags_path = ENV['CHEF_DATA_BAGS'] || '../../data_bags'
    chef.roles_path = ENV['CHEF_ROLES'] || '../../roles'

    chef.run_list = ['recipe[god::test]']

    chef.custom_config_path = 'vagrant-chef-solo.rb'

    chef.json = {
      god: {
        test: {
          remove_watch: ENV['GOD_REMOVE_WATCH'] && ENV['GOD_REMOVE_WATCH'].downcase != 'false'
        }
      }
    }
  end
end
