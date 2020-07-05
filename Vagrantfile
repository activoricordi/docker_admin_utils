# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant Variables
BACKEND_MEMORY = 2048
VAGRANTFILE_API_VERSION = "2"

# Load Vagrant Ruby Modules
Dir.glob("./modules/*.rb") do |fileName|
    require fileName
end

# Check if Plugins are installed
PluginsChecker.ensurePluginsInstalled(['vagrant-vbguest'])
PluginsChecker.ensurePluginsInstalled(['vagrant-hostmanager'])
PluginsChecker.ensurePluginsInstalled(['yaml'])
PluginsChecker.ensurePluginsInstalled(['vagrant-cachier'])
docks = Settings.readConfiguration('config', 'config.yml')

# This file requires Vagrant 2.0 and above.
# Although versions 1.6.x should behave very similarly, it is recommended
# to upgrade instead of disabling the requirement below.
Vagrant.require_version '>= 2.1'

# START VAGRANT CONFIGURATION
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  docks.each do |docks|
    # Store directory name as reference to sitename
    vagrant_sitename = docks["siteName"].to_s
    vagrant_syncedfolder = docks["syncedfolder"].to_s
    vagrant_domain = "#{vagrant_sitename}.dev"

    ### Make Host Name dynamic based on Vagrant dock name
    config.vm.hostname = "#{vagrant_domain}"
    
    ### Configure automatically updates
    config.vm.box_check_update = true

    ### Configure vbguest updates
    if Vagrant.has_plugin?('vagrant-vbguest')
      config.vbguest.auto_update = true
    end

    if Vagrant.has_plugin?('vagrant-hostmanager')
      config.hostmanager.enabled = true
      config.hostmanager.manage_host = true
      config.hostmanager.manage_guest = true
      # config.hostmanager.ignore_private_ip = false
      config.hostmanager.include_offline = true
    end

    # Cache software packages
    if Vagrant.has_plugin?('vagrant-cachier')
      config.cache.scope = :box
      config.cache.enable :apt
      config.cache.enable :apt_lists
      config.cache.enable :apt_cacher
    #  config.cache.enable :pip
      config.cache.enable :npm
    end
     # debug: puts "Virtual Machine hostname is #{config.vm.hostname}"
    
    ### SSH CONFIGURATION  
    # Always use Vagrant insecure key ssh
    config.ssh.insert_key = false
    config.ssh.username = docks["ssh_username"]
    config.ssh.password = docks["ssh_password"]

    ### NETWORK CONFIGURATION
    
    # vagrant_ip = "192.168.56." + rand(256).to_s
    vagrant_ip = "127.0.0.1"
    # config.vm.network "private_network", ip: "#{vagrant_ip}"
    # Port forwarding - Set the forwarded ports
    config.vm.network :forwarded_port, guest: docks['guest_ssh_port'], host: docks['host_ssh_port'], id: "ssh", auto_correct: true
    # config.vm.network :forwarded_port, guest: 3000, host: 3000, host_ip: "#{vagrant_ip}"
    config.vm.network :forwarded_port, guest: docks['guest_http_port'], host: docks['host_http_port'],id: "http", auto_correct: true
    
    # Configure forwarded ports
    config.vm.network "forwarded_port", guest: 2181, host: 2181 # Zookeeper
    config.vm.network "forwarded_port", guest: 9092, host: 9092 # Kafka
    config.vm.network "forwarded_port", guest: 8081, host: 8081 # Schema registry
    config.vm.network "forwarded_port", guest: 9021, host: 9021 # Confluent Control Center

  
    ### VIRTUAL MACHINE CONFIGURATION
    ### Use minimum ubuntu trusty docker vagrant file.
    config.vm.box = docks["image"]
    config.vm.box_version = docks['imageVersion']

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "/vagrdock/#{vagrant_syncedfolder}/","/home/vagrant/#{vagrant_syncedfolder}/",create: true, owner: "vagrant", group: "vagrant", mount_options: ["uid=33","gid=33","dmode=755","fmode=644"]
  
   config.vm.synced_folder "C:/HashiCorp/vagrantboxes/vagrdock/provisioning/","/home/vagrant/#{vagrant_syncedfolder}/",create: true, owner: "vagrant", group: "vagrant", mount_options: ["uid=33","gid=33","dmode=755","fmode=644"]
   

  # Virtualbox Provider-specific configuration 
  config.vm.provider "virtualbox" do |vb, override|
  # Make Virtualbox Machine Name dynamic based on Vagrant project name

      vb.name = "#{vagrant_sitename}"
      vb.check_guest_additions = true
      vb.functional_vboxsf     = true
      vb.linked_clone = true
      # Create a Headless Virtual box
      vb.gui = false

      # override box url
      override.vm.box = docks["image"]
      override.vm.box_version = docks["imageVersion"]

      ## Customize the amount of memory on the VM:
      vb.customize ["modifyvm", :id, "--memory", docks["vm_memory"]]
      vb.customize ["modifyvm", :id, "--cpus", docks["vm_cpus"]]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
    
      ## Change the network adapter type and promiscuous mode
      vb.customize ['modifyvm', :id, '--nictype1', 'Am79C973']
      vb.customize ['modifyvm', :id, '--nicpromisc1', 'allow-all']
      vb.customize ['modifyvm', :id, '--nictype2', 'Am79C973']
      vb.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']

      vb.destroy_unused_network_interfaces = true
   end # End Virtual box configuration
  
   # Start Basic Provisioning
   shellfile = "#{vagrant_syncedfolder}/shell/vagrant-bootstrap.sh"
   config.vm.provision :shell, path: "#{shellfile}", keep_color: true, args: "#{vagrant_domain}"

   config.vm.provision "ansible_local" do |ansible|
       ansible.install_mode = 'pip'
       ansible.version = "latest"
       ansible.provisioning_path = "/vagrant/provisioning/"
   #   ansible.inventory_path = "/vagrant/ansible/inventory"
       ansible.limit = 'all'
       ansible.verbose = true
       # ansible.verbose = "vvv"
       ansible.playbook = "playbook.yml"
       ansible.become = true
       ansible.extra_vars = {
         ansible_ssh_user: "vagrant",
         ansible_python_interpreter: "/usr/bin/python3",
         ansible_ssh_private_key_file: "~/.vagrant.d/insecure_private_key"
        }
    end

    puts "Dock Provisioning sucessful: The domain is #{vagrant_domain} and the #{vagrant_ip} is the following."
    # puts "Dock Sitename is #{vagrant_sitename}"
    # puts "Dock folder is /#{vagrant_sitename}/provisioning/"
    # puts "Dock will listen at #{vagrant_ip}"
  end
  # Close docks
end
