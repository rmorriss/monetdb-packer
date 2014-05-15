#!/bin/bash

#######################################################
# Install VirtualBox Guest Additions
#######################################################
echo "INSTALLING GUEST ADDITIONS"

# Install required packages
yum -y install bzip2 dkms kernel-devel

# Mount the disk image
cd /tmp
mkdir /tmp/vbox-guest-additions
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso /tmp/vbox-guest-additions

# Install the Guest Additions
sh /tmp/vbox-guest-additions/VBoxLinuxAdditions.run

# Cleanup files
umount vbox-guest-additions
rm -rf vbox-guest-additions
# Remove VirtualBox Guest additions ISOs
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?
# And packages
yum -y remove kernel-devel kernel-debug-devel dkms
