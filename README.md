monetdb-packer
==============

Packer templates, provisioning scripts and Kickstart configs for building the MonetDB.R Analytical Database Appliance images.
- Templates for building the images
- Scripts for installing software, setting-up the environment and loading data
- Kickstart configs for unattended OS installation

To use the templates, clone/download the repository on your computer and run:
packer validate <template>.json
packer build <template>.json

MonetDB.R
=========
http://monetr.r-forge.r-project.org

Version history
===============
2013-08-06 - hannesmuehleisen - Fedora 19 MonetDB.R setup scripts 
2014-03-27 - dnedev - Packer templates, Fedora Kickstart config, additional provisioning
