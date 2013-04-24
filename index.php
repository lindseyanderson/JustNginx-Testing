<?php
/*
 @file   : index.php
 Responsible for pulling the proper headers from the user curl

 @date   : 4/24/2013
 @author : Lindsey Anderson
*/

# Check to see if our headers are set, a host header is required
foreach ($_SERVER as $name => $value)  {
	# Since we're proxying requests to php-fpm, we need to search for HTTP
	# headers to be relevent:
	if(substr($name, 0, 5) == 'HTTP_') {
		# Check our headers
		if(strtoupper($name) == "HTTP_HOST"){
			$header_host = $value;
		}
		if(strtoupper($name) == "HTTP_X_PORT"){
			if(is_numeric($value)) {
				$header_port = $value;
			} else {
				$header_port = 80;
			}
		}
		if(strtoupper($name) == "HTTP_X_DOCROOT"){
			$header_docroot = $value;
		} else {
			$header_docroot = "/var/www/vhosts/$header_host/htdocs";
		}
	}
}
# Create a new Virtual Host
include('inc/server_block.php');
?>
