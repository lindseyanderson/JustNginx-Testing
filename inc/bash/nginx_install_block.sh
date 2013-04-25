#!/bin/bash
# @file  : server_block.sh
# Using an Nginx template provided, attempt to install it on a remote server
# @date  : 04/24/2013
# @author: Lindsey Anderson
# @license: server_block.sh is a part of JustCurl
#
#    JustCurl is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    JustCurl is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with JustCurl.  If not, see <http://www.gnu.org/licenses/>.


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
