# Vagrant Boilerplate

Vagrant is an automation tool with a domain-specific language (DSL) that is used to automate the creation of VMs and VM environments.

The **Vagrant** Boilerplate is a template project for simplifying Vagrant project on multiple Providers (Amazon Web Services,Microsof Azure, Google Cloud Computing and VirtualBox). It is structured in the following way.

* It uses **Vagrant** System for creating Development Environment which could tested at a Virtualbox environment and be then port to Cloud Environments.
* It makes use of **Ansible** playbooks for automating Virtual Machine configuration.
* It makes use of Docker configuration files for Container-based landscapes.

## Overview

### Vagrantfile

The Vagrant file contains all the Vagrant Machine creation workflow. Although, Vagrant uses a **Domain Special Language**.Vagrant files are created in a programming language called Ruby.

```ruby
# This file requires Vagrant 2.0 and above.
# Although versions 1.6.x should behave very similarly, it is recommended
# to upgrade instead of disabling the requirement below.
Vagrant.require_version '>= 2.1'

# START VAGRANT CONFIGURATION
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Cover all the configuration for the diferent providers
  
end
```

### Modules

### Config

## Commands

### Vagrant Boilerplate Install

The recommended way to install this project is to **clone**

To set up your development environment, first install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) >= 1.5.4. Once installed, you can start the VM by typing the following into terminal:

Create or start the VM:

```bash
    vagrant up
```

The Vagrant file has a number of providers. The providers indicate where the Vagrant Machine is created. The providers are the following:

* Amazon Web Services
* Google Cloud Platform
* VirtualBox
* Microsoft Azure

This instruction indicates that the Virtual Machine needs to be executed at Microsoft Azure.

```bash
vagrant up --provision --provider azure
```

To view project:

```bash
    open http://localhost:3000/
```

### Restart

At the moment, you need to manually restart the Docker container after the initial boot of your Vagrant VM (e.g. `vagrant halt` and `vagrant up`). This can be done with the following in terminal:

### VM Boot

Boot the VM:

```bash
vagrant up --provision
```

If we do not need or want to provision again the Virtual Machine already created by Vagrant. To SSH into the VM, we execute the following command **vagrant ssh** at the Terminal console:

```bash
  # to get into running container:
  vagrant ssh
```

To share a **http** port, we execute the following statement.

```bash
vagrant share --http
```

This command opens the Vagrant Command Line. To debug the Vagrant Provision process is executed in Windows with the following statement:

```bash
vagrant up --provision --debug 2>&1 | Tee-Object -FilePath ".\vagrant.log"
```

## Vagrant Functions

Chosen Vagrant functions are from [Vagrant libs](https://github.com/FractalizeR/vagrant-libs) from **FractalizeR**.

## Shell Vagrant Bootstrap

We have created a basic Vagrant Bootstrap Shell for creating basic configuration settings

### Upgrade existing python to Python 3

To work with the Ansible Provisioner is recommended to replace the default Python environment to the latest compatible Python 3.6 version.

### References

This project leverage best practices coming from the following Vagrant Projects:

* [Vagrant Boilerplate from Thomas Marcon @Tehem http://www.tehem.net](https://github.com/Tehem/vagrant_boilerplate)
* [Bring your production environment home with Vagrant and Ansible](https://rjzaworski.com/2015/07/bring-your-production-environment-home-with-vagrant-and-ansible)
* [DevOps from Scratch, Part 1: Vagrant & Ansible](https://www.kevinlondon.com/2016/09/19/devops-from-scratch-pt-1.html)
* [Vagrant Boilerplate Bootstrap sh](https://github.com/fongandrew/vagrant-boilerplate/blob/master/bin/bootstrap.sh)
