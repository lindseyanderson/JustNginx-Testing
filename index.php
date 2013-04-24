<?php
/*
 @file   : index.php
 Responsible for pulling the proper headers from the user curl

 @date   : 4/24/2013
 @author : Lindsey Anderson

 @license: index.php is a part of JustCurl

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

# Check to see if our headers are set, a host header is required
foreach ($_SERVER as $name => $value)  {
	# Since we're proxying requests to php-fpm, we need to search for HTTP
	# headers to be relevent:
	if(substr($name, 0, 5) == 'HTTP_') {
		# Check our headers
		if(strtoupper($name) == "HTTP_HOST"){
			$header_host = strtolower($value);
		}
		if(strtoupper($name) == "HTTP_X_PORT"){
			if(is_numeric($value)) {
				$header_port = $value;
			} else {
				$header_port = 80;
			}
		}
		if(strtoupper($name) == "HTTP_X_DOCROOT"){
			$header_docroot = strtolower($value);
		} else {
			$header_docroot = "/var/www/vhosts/$header_host/htdocs";
		}
		if(strtoupper($name) == "HTTP_X_WEBSERVICE"){
			if(strtolower($value) == "nginx"){
				$header_webservice = "nginx";
			} else {
				$header_webservice = "apache";
			}
		} else {
			$header_webservice = "nginx";
		}
	}
}
# Create a new Virtual Host
if($header_webservice == "nginx") {
	include('inc/server_block.php');
}
?>
