<?php
/*
@file  : server_block.php
Create the data we'll send to our clients by pulling in template data

@date  : 04/24/2013
@author: Lindsey Anderson

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
