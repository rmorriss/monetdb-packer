#!/bin/bash

#######################################################
# Clean-up space before exporting the image
#######################################################
echo "CLEAN-UP"

# Remove old kernels
package-cleanup -y --oldkernels --count=1

# Clean yum cache
yum clean all

# Clean-up chaches
rm -rf /var/cache/* /usr/share/doc/*

# Clean-up the unused disk space
#cat /dev/zero > /tmp/zero.fill
#rm -rf /tmp/zero.fill
