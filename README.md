JustCurl - A virtual host / server_block creation script
================================

[JustNginx](http://justnginx.com/) - currently exists as a combination of PHP and BASH.  

[JustCurl](http://justcurl.com/) - currently exists as a combination of PHP and BASH.  

This is an automated script for both virtual host creation in either Nginx or Apache. They currently exist as two separate entities and will be combined into a more robust solution.  Other features will be added as we go to eventually encompass the following:

Features
-------------------------
* Apache Virtual Host creation
 * _Apache Installation available_
* Nginx Virtual Host creation
 * _Nginx Installation available_

To Do
-------------------------
* MySQL Database creation
* MongoDB Database creation
* Wordpress installation
* Drupal installation


Usage 
-------------------------

	python <( curl 	-H "host: example.com" \
		-H "x-port: 80" \
		-H "x-docroot: /var/www/vhosts/example.com" \
		justnginx.com )


These headers are likely to change as better ones are thought up.  Check back for current usage. 

Defaults
-------------------------

A host header must always be specified when attempting a virtual host installation.  The following are default values for the remaining headers:

* x-port:    80
* x-docroot: /var/www/vhosts/%{domain_name}/htdocs


License
-------------------------

This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.


Contact
-------------------------

Email: lindsey.anderson@rackspace.com
