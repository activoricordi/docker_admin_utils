# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant Variablesvag
BACKEND_MEMORY = 2048
SSH_USERNAME = 'vagrant'
VAGRANTFILE_API_VERSION = "2"

# Load Vagrant Ruby Modules
Dir.glob("./modules/*.rb") do |fileName|
    require fileName
end

# Check if Plugins are installed
PluginsChecker.ensurePluginsInstalled(['vagrant-vbguest'])
PluginsChecker.ensurePluginsInstalled(['yaml'])
PluginsChecker.ensurePluginsInstalled(['vagrant-aws']) # vagrant plugin install vagrant-aws
PluginsChecker.ensurePluginsInstalled(['vagrant-azure']) # vagrant plugin install vagrant-azure
PluginsChecker.ensurePluginsInstalled(['vagrant-google'])
settings = Settings.readConfiguration('config', 'config.yml')

# This file requires Vagrant 2.0 and above.
# Although versions 1.6.x should behave very similarly, it is recommended
# to upgrade instead of disabling the requirement below.
Vagrant.require_version '>= 2.1'

# START VAGRANT CONFIGURATION
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # Store directory name as reference to sitename
  vagrant_sitename = Settings.siteName()
  vagrant_domain = "#{vagrant_sitename}.dev"
  vagrant_ip = "192.168.32." + rand(256).to_s

  ### Configure automatically updates
  config.vbguest.auto_update = true
  config.vm.box_check_update = true

  ### Make Host Name dynamic based on Vagrant project name
  config.vm.hostname = "#{vagrant_domain}"

  # debug: puts "Virtual Machine hostname is #{config.vm.hostname}"
  
  ### SSH CONFIGURATION  
  # Always use Vagrant insecure key ssh
  config.ssh.insert_key = false
  # config.ssh.username = "#{SSH_USERNAME}"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  
  ### NETWORK CONFIGURATION
  config.vm.network "private_network", ip: "#{vagrant_ip}"
  
  # Port forwarding - Set the forwarded ports
  config.vm.network :forwarded_port, guest: 22, host:2222, id: "ssh", auto_correct: true
  config.vm.network :forwarded_port, guest: 3000, host: 3000, host_ip: "#{vagrant_ip}"
  
  ### VIRTUAL MACHINE CONFIGURATION
  ### Use minimum ubuntu trusty docker vagrant file.
  config.vm.box = "bento/ubuntu-18.10"
  config.vm.box_version = "201812.27.0"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "C:/HashiCorp/vagrantboxes/vgrant_boilerplate/provisioning/", "/provisioning", mount_options: ["uid=33","gid=33","dmode=755","fmode=644"]
  
  # config.vm.synced_folder "./provisioning/", "/provisioning",type: 'smb'
   

  # Virtualbox Provider-specific configuration 
  config.vm.provider "virtualbox" do |vb, override|
  # Make Virtualbox Machine Name dynamic based on Vagrant project name

      vb.name = vagrant_sitename
      vb.check_guest_additions = true
      vb.functional_vboxsf     = true
      vb.linked_clone = true
      # Create a Headless Virtual box
      vb.gui = false

      # override box url
      override.vm.box = "bento/ubuntu-18.10"
      override.vm.box_version = "201812.27.0"

      ## Customize the amount of memory on the VM:
      vb.customize ["modifyvm", :id, "--memory", 2048]
      vb.customize ["modifyvm", :id, "--cpus", 2]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
    
      ## Change the network adapter type and promiscuous mode
      vb.customize ['modifyvm', :id, '--nictype1', 'Am79C973']
      vb.customize ['modifyvm', :id, '--nicpromisc1', 'allow-all']
      vb.customize ['modifyvm', :id, '--nictype2', 'Am79C973']
      vb.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']

      vb.destroy_unused_network_interfaces = true
   end # End Virtual box configuration

   # Amazon Web Service Provider-specific configuration 
   config.vm.provider 'aws' do |aws, override|
    # Use dummy AWS box (override in provider configuration blocks)
    aws.vm.box = 'aws-dummy'
     # Specify access/authentication information
    # aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    # aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']

    # Specify default AWS key pair
    aws.keypair_name = 'aws_rsa'

    # Specify default region and default AMI ID
    aws.region = 'us-west-2'
   end # End Amazon Web Services configuration
   
   # Azure Provider-specific configuration 
   config.vm.provider 'azure' do |azure, override|
    azure.vm.box = ''
   end # End Azure configuration

   # Google Cloud Platfomr Provider-specific configuration 
   config.vm.provider 'gcp' do |gcp, override|
    gcp.vm.box = ''
   end # End Google Cloud Computing configuration
  
   # Start Basic Provisioning
   config.vm.provision :shell, path: 'provisioning/shell/vagrant-bootstrap.sh', keep_color: true, args: "#{vagrant_domain}"

   config.vm.provision "ansible_local" do |ansible|
       ansible.install_mode = 'pip'
       ansible.version = "latest"
       ansible.provisioning_path = "/provisioning/"
   #   ansible.inventory_path = "/vagrant/ansible/inventory"
       ansible.limit = 'all'
       ansible.verbose = true
       ansible.playbook = "playbook.yml"
       ansible.become = true
       ansible.extra_vars = {
         ansible_ssh_user: "vagrant",
         ansible_python_interpreter: "/usr/bin/python3",
         ansible_ssh_private_key_file: "~/.vagrant.d/insecure_private_key"
        }
    end

    puts "Server Provisioning sucessful: The domain is #{vagrant_domain} and the #{vagrant_ip} is the following."
    puts "Servers will listen at #{vagrant_ip}"
end
