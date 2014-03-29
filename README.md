docker_admin_utils
==================

This is a repository of a set of Docker Administration files to automate Container Management for the Dockerfiles created.

Docker is a great tool for creating lightweight isolated application environments also known as containers. More specifically the Linux containers. Among its main Uses cases, Docker is a tool for building and deploying applications by packaging them into lightweight containers. A container can hold pretty much any software component along with its own dependencies.

Docker provides excellent virtualization capabilities for generating development environments. Docker is based in Lightweight Linux Container technologies so it runs only on Linux. That does not mean we could not use it in both Windows and MacOSX. On To install Docker for using in Windows or Mac, the process is truly similar. It is necessary to setup a Virtual Machine (VM) with Linux installed on it in order to use it.

The architecture used for defining these Docker Administration Utilities is based in the following assumptions:

* For Windows OS and Mac OS environments, we are going to use Oracle Virtual Box and Vagrant for ease the installation instead of using boot2Docker. On my humble opinion, VagrantUp provides an additional features, an extra level of customization and added value which is extremely complementary to Docker. VagrantUp allows to move to common Container actions and features to VM level. Specially when we divide and encapsulating our application in different Docker containers.
* For Linux OS (specifically Debian Distributions at this time), the same script which is created for Vagrantfiles.


As we have indicated before, this is a heavily opinionated project which challenges for MacOSX and WindowsOS the installation process indicated in the Docker installation page. On our understanding, VagrantUp provides an additional layer of customization which is extremely beneficial to organize an Enterprise Docker architecture which are not available now in the tool.

As you probably know, Docker´s AUFS currently only supports 42 layers. I am not going to get in theory behind this limitation, but in practice, This means that only 42 RUN commands will be executed. This makes recommendable to move non specific container functionality to the common VM.
> apt-get install openjdk-6-jdk git unzip

