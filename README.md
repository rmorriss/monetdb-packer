monetdb-packer
==============

Packer templates, provisioning scripts and Kickstart configs for building the MonetDB.R Analytical Database Appliance images.
* Templates and scripts for for building the images for:
	* CentOS 6.5 / Amazon Linux 2014.3.2
	* CentOS 7
	* Fedora 20
* Templates for building the images for:
	* AWS AMI (HVM, EBS-based)
	* VirtualBox OVF (ISO-based)
	* Docker container
* Scripts for installing software, setting-up the environment and loading data:
	* MonetDB service definition
	* Setting lognin screen and motd
	* Setting up user shells
	* Setting up non-admin users
	* Loading sample VOC dataset
* Kickstart configs for unattended OS installation for:
	* CentOS 6.5 / 7
	* Fedora 20 x86_64

Usage
-----
To use the templates, clone/download the repository on your computer and run:
```shell
packer validate <template>.json
packer build <template>.json
```

Read more
---------
https://monetdbsolutions.com/solutions/cloud

MonetDB.R
----------
http://monetr.r-forge.r-project.org

Packer
------
http://www.packer.io

Docker
------
https://www.docker.com
