# Home

The _projectName_ allows to build Infrastructure-as-a-code and continuous integration landscapes. It uses the following tools:

## Vagrant

**Vagrant** is an open source project used for building and distributing virtual environments. It allows to manage, configure and share virtual machines.

**Vagrant** is used to better isolate Operating System dependencies between Windows, Mac and Linux host environments. It also allows to forget about managing and installing configuration, continuous integration, testing tools such as Ansible, Docker, Terraform and other.

**Vagrant** makes unnecessary to configure and setup the workflow, continuous integration and automation tools. Building an **Infrastructure-as-a-Code** landscape gets more and more complicated each day. There are multitude of application and tools to take in account: Provisioner, Cloud Providers, etc.

**Vagrant** is built on Ruby and uses Virtual environment tools such as VirtualBox, VWare or Hyper-V to generate Virtual machines.

## Ansible

It is a great configuration tool which aims to ease provisioning. **Ansible** connects to the deployed instances by Terraform. **Ansible** is responsible of installing the software required.

## Terraform

It is responsible for deploying the infrastructure.

## Inspec

**Inspec** is responsible of testing. **Testing** is necessary since Infrastructure change making necessary to refactor Infrastructure's code as well.

The developers change making necessary to validate and test while making changes. It reduces risks increasing deployment confidence and therefore reducing stress.

Dependencies changes which make necessary to validate and test everything is working correctly.

## Baking

Baking with Packer
