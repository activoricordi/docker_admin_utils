# COMMON ROLE

This role install the basic packages:

* locales
* build-essential
* acl
* ntp
* htop
* git
* python-pip
* python3-pip
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
