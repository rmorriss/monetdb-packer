#!/bin/bash

#######################################################
# Clean-up space before exporting the image
#######################################################
echo "CLEAN-UP"

# Remove old kernels
#package-cleanup --oldkernels --count=1

# Clean yum cache
yum clean all

# Clean-up chaches
rm -rf /var/cache/* /usr/share/doc/*

# Remove VirtualBox Guest additions ISOs
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

# Clean-up the unused disk space
#cat /dev/zero > /tmp/zero.fill
#rm -rf /tmp/zero.fill
