# Machine Learning Development Environment

The Machine Learning Development Environment is built using Python 3.6.

## Machine Learning Roles

The <vgrant_boilerplate> project has several roles designed to build Machine Learning landscapes and environments:

1. A **Machine Learning Development Environment**. This development environment.
1. **Machine Learning Landscape:** It is built using a set of Docker containers over a single Virtual Machine.

## Development Shared Folder

To enable a folder where developers can push their code, a **development shared folder** is mount at the **Machine Learning Development Environment**.

We are pointing our editor to our development folder. At the **.gitignore** we have included this folder, so it will be never sync with the Git repository.

## JupyterLab

The JupyterLab requires Jupyter Core to be installed.

## Altair Visualization

## Machine Learning Files

There is a folder named **files** on the Ansible role which contains a set of files used to customize the installation.

## References

* [Create Jupyter Deployment with  Ansible](https://www.jitsejan.com/creating-ansible-deployment-for-ubuntu-vps.html)
* [Altair Viz](https://github.com/altair-viz)
* [how to setup you jupyterlab project environment](https://towardsdatascience.com/how-to-setup-your-jupyterlab-project-environment-74909dade29b)
