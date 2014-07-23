#!/bin/bash

#######################################################
# Load VOC data
#######################################################
echo "Loading VOC dataset"

# create schema voc and set it as the dedault for the monetdbuser user
mclient db -s "CREATE SCHEMA \"voc\" AUTHORIZATION \"monetdbuser\""
mclient db -s "ALTER USER \"monetdbuser\" SET SCHEMA \"voc\""

wget https://dev.monetdb.org/Assets/VOC/voc_dump.sql.gz
gunzip voc_dump.sql.gz
# Add set schema statement
sed -i '1s/^/SET SCHEMA "voc";\n/' voc_dump.sql
# Load the data, but redirect stdout to /dev/null
# Don't worry any errors will still be printed
mclient db < voc_dump.sql > /dev/null

# Clean-up
rm -rf voc_dump.sql
