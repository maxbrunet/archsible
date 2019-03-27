# Archsible

Ansible playbook to fully manage your Arch linux installation from bootstrap to day-to-day changes.

This is a work in progress and still at an early stage of development, I aim to only manage my personal Linux installation for the moment. But if I have time, I'll try to turn it into a flexible framework to support different pieces of hardware and software with a lot of room for customization.

## Installation

* [Get and boot an Arch installation media](https://wiki.archlinux.org/index.php/Getting_and_installing_Arch)
* [Connect to the Internet](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_Internet)
* Ensure you have a fast mirror configured for the installation phase:

```shell
echo 'Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
```

* Clone the repository

```shell
git clone https://github.com/maxbrunet/archsible.git
```

* Install `pip` and the requirements:

```shell
pacman -Sy python-pip
cd archsible
pip install -r requirements.txt
ansible-galaxy install -r requirements.yml -p ansible/roles/vendor
```

* Use the Ansible variables to configure Archsible to suit your needs
  (See README files in each roles)
* Run the boostrap playbook

```shell
cd ansible
ansible-playbook --inventory localhost, bootstrap.yml
```

## Make changes

Once your Arch linux installation is up and running, make regular changes through Ansible by editing the playbook, roles and variables and apply them by using directly `archsible.yml`.

```shell
cd ansible
ansible-playbook --inventory localhost, archsible.yml
```

## Test with Packer and Vagrant

* Requirements
  * [Packer](https://www.packer.io)
  * [Vagrant](https://www.vagrantup.com)
  * [VirtalBox](https://www.virtualbox.org)
* Build Vagrant box

```shell
packer build packer_archsible.json
```

* Create virtual machine

```shell
vagrant up
```

* Use `vagrant ssh` to get a shell
