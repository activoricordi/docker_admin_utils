# Ansible tool

## Ansible Provisioner

Ansible is a powerful tool for configuration management and orchestration of your infrastructure. Since its release 18.0, there is a new provisioner called **ansible_local** which install Ansible on the Ubuntu VM and then run it there. The _Ansible_local_ provisioner will install Ansible on the Ubuntu VM. Using the _Ansible_local_ provisioner allows to use _Ansible_ without having to install Ansible on our host computer. The Vagrant Ansible provisioner `ansible_local` where Ansible is executed on the **Vagrant guest**.

The _Ansible Local Provisioner_ describes the desired state for a computer using a Playbook. It requires that all the Ansible Playbook files are available on the guest machine, at the location referred by the _provisioning_path_ option.

These files present on the host machine in the Vagrant Synced folder. The _Playbooks_ files are YAML files. These YAML files describe the automation steps. To test the basic Vagrant, a simple shell script is created in the _playbook.yml_.

```yaml
# ./dev/playbook.yml
---
- hosts: all
  tasks:
    - name: Hello, world
      shell: 'echo "Hey there! --ansible" > /home/vagrant/hello_world.txt'
```

Before actually start using _Ansible_, it is necessary to create an _Inventory_ file.

### 1.7. Ansible Roles

The Inside the **provisioning > roles** folder

#### Common Role

#### Postgress Role

##### PostgreSQL Database

Develop a PostgreSQL database environment

#### Docker Role

##### Docker Admin Utils

This is a repository of a set of **Docker** Administration files to automate Container Management for the ****Docker**files** created.

**Docker** is a great tool for creating lightweight isolated application environments also known as containers. More specifically the Linux containers. Among its main Uses cases, **Docker** is a tool for building and deploying applications by packaging them into lightweight containers. A container can hold pretty much any software component along with its own dependencies.

**Docker** provides excellent virtualization capabilities for generating development environments. **Docker** is based in Lightweight Linux Container technologies so it runs only on Linux. That does not mean we could not use it in both Windows OS and MacOSX. On To install **Docker** for using in Windows or Mac, the process is truly similar. It is necessary to setup a Virtual Machine (VM) with Linux installed on it in order to use it.

The architecture used for defining these **Docker** Administration Utilities is based in the following assumptions:

For Windows OS and Mac OS environments, we are going to use Oracle Virtual Box and Vagrant for ease the installation instead of using boot2Docker. On my humble opinion, VagrantUp provides an additional features, an extra level of customization and added value which is extremely complementary to **Docker**. VagrantUp allows to move to common Container actions and features to VM level. Specially when we divide and encapsulating our application in different **Docker** containers.

For Linux OS (specifically Debian Distributions at this time), the same script which is created for Vagrantfiles.

As we have indicated before, this is a heavily opinionated project which challenges for MacOSX and WindowsOS the installation process indicated in the **Docker** installation page. On our understanding, VagrantUp provides an additional layer of customization which is extremely beneficial to organize an Enterprise **Docker** architecture which are not available now in the tool.

As you probably know, Docker´s AUFS currently only supports 42 layers. I am not going to get in theory behind this limitation, but in practice, This means that only 42 RUN commands will be executed. This makes recommendable to move non specific container functionality to the common VM.

### Ansible Playbook

The Ansible Playbook has a default task which is called **Install new machine**. This task installs a new machine 

```yaml
---
- name: "Install new machine"
  hosts: "all"
  connection: local
  become: yes
  gather_facts: yes
# Execute the following roles
  roles:
    - common
    - nodejs
```

### Ansible Roles

The Ansible Playbook execute a set of tasks for creating a new machine.

#### Common Roles

* The common system with install the following tasks.

#### Elixir Roles

These roles take as a reference the following projects:

* [Ansible Elixir Stack](https://github.com/HashNuke/ansible-elixir-stack)

##### Basic Erlang

This role executes a set of tasks for creating a default **Erlang** machine which can be accessed from the Terminal. It perform the checks to verify the configuration prerequisities and it automates the installation task.

##### Basic Elixir

This role executes the Ansible installed at the Vagrant box.

##### Elixir + Phoenix + GraphQL + Elm  + PostgreSQL Database Application Role

We could use the Elixir Development Box for developing a **Phoenix ELM Frontend**.

We have created as Use Case example an Ansible Playbook for building two Virtual Machines one for Elixir Dev Box and another with PostgreSQL.

#### Go Languague Role

To build a Go Development Machine

#### NodeJS Role
