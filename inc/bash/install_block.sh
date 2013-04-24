#!/bin/bash
# @file  : server_block.sh
# Using an Nginx template provided, attempt to install it on a remote server
# @date  : 04/24/2013
# @author: Lindsey Anderson

# Check to ensure our include directory exists
if [ ! -d /etc/nginx/sites-available || ! -d /etc/nginx/sites-enabled ]; then
	mkdir -p /etc/nginx/sites-available &&
	mkdir -p /etc/nginx/sites-enabled
	# If the directories do not exist, it's safe to add an include

else
	if [ -f /etc/nginx/sites-available/${site_url} ]; then
		echo "File exists for site ${site_url}."
		exit
	fi
fi

# Once the check is finished, enable the server blocks
BLOCK_DATA = "${DATA}"
echo ${BLOCK_DATA} > /etc/nginx/sites-available/${site_url} &&
mkdir -p ${docroot} &&
service nginx reload
