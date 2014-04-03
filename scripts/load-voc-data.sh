#!/bin/bash

#######################################################
# Load VOC data
#######################################################
echo "Loading VOC dataset"

wget http://dev.monetdb.org/Assets/VOC/voc_dump.sql.gz
gunzip voc_dump.sql.gz
# Add set schema statement
sed -i '1s/^/SET SCHEMA "voc";\n/' voc_dump.sql
# Load the data, but redirect stdout to /dev/null
# Don't worry any errors will still be printed
mclient db < voc_dump.sql > /dev/null

# Clean-up
rm -rf voc_dump.sql
