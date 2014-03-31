monetdb-packer
==============

Packer templates, provisioning scripts and Kickstart configs for building the MonetDB.R Analytical Database Appliance images.
* Templates for building the images for:
** VirtualBox
* Scripts for installing software, setting-up the environment and loading data:
** Getting the IP address of the machine and adding it to the welcome screeen
** Setting up user shells
* Kickstart configs for unattended OS installation for:
** Fedora

Usage
-----
To use the templates, clone/download the repository on your computer and run:
	packer validate <template>.json
	packer build <template>.json

MonetDB.R
----------
http://monetr.r-forge.r-project.org

Version history
---------------
* 2013-08-06 - hannesmuehleisen - Fedora 19 MonetDB.R setup scripts 
* 2014-03-27 - dnedev - Packer templates, Fedora Kickstart config, additional provisioning
