<?php
/*
@file  : server_block.php
Create the data we'll send to our clients by pulling in template data

@date  : 04/24/2013
@author: Lindsey Anderson

 @license: server_block.php is a part of JustCurl

    JustCurl is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JustCurl is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JustCurl.  If not, see <http://www.gnu.org/licenses/>.
*/


# Pull in our default template, update the contents as required
$server_block	  = file_get_contents('inc/templates/nginx_server_block.template');
# Check to see if file exists prior to creation
$installer_script = file_get_contents('inc/bash/install_block.sh');

# Replace text for easy passing on
$installer	  = str_replace("\${DATA}", $server_block, $installer_script);
$installer	  = str_replace("\${site_url}", $header_host, $installer);
$installer	  = str_replace("\${port}", $header_port, $installer);
$installer	  = str_replace("\${docroot}", $header_docroot, $installer);

print $installer;
?>
