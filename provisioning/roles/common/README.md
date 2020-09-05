# COMMON ROLE

This role install the basic packages:
Docker is a highly optimized platform for building and running containers on servers. It manage containers in a highly efficient manner and works incredibly well with Ansible.

Ansible is an automation tool that aims to ease tasks like configuration management, application deployment and intra-service orchestration. It has a built-in Docker module that integrates with Docker for container management.

Install the basic packages:

* locales
* build-essential
* acl
* ntp
* htop
* git
* python-pip
* python3-pip
* python3-docker
* libpq-dev

## Ansible Container

The **Ansible Container** tool allows you to build Docker images using Ansible playbook. This allows to get rid of the Dockerfile format.

```python
sudo pip install ansible-container
```

This comes five basic actions:

* **ansible-container init** to initialize an empty container project. For instance, we could init the following container:

```bash
ansible-container init ansible.gatsbyjs-gulp
Absible Container initialized fro Galaxy container app 'ansible.gatsbyjs-gulp'
```

* **ansible-container installs** to download and install necessary ansible-roles.

One of the main advantages of **Ansible** is the ability to roll testing directly into your deployment process. Using the **assert** module, it is possible to build functional checks directly into the deployment playbook.
## References

* [Docker without dockerfiles/](https://tech.labs.oliverwyman.com/blog/2019/08/30/docker-without-dockerfiles/)
* [How I Switched from Docker-Compose to Pure Ansible](https://www.ansible.com/blog/how-i-switched-from-docker-compose-to-pure-ansible)
* [Why I use Ansible over docker-compose](https://dev.to/kuwv/why-i-use-ansible-over-docker-compose-edg)
* [Podman/Buildah toolchain in Ubuntu](https://dev.to/jj/podman-buildah-toolchain-in-ubuntu-5d2o)
* [Multi Macchine Vagrant Ansible](https://willroe.me/2014/12/30/multi-machine-vagrant-ansible-gotcha.html)

### Docker Container Tests

* [Shrun](https://www.npmjs.com/package/shrun)
