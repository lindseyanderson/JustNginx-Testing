JustCurl - A virtual host / server_block creation script
================================

[JustNginx](http://justnginx.com/) - currently exists as a combination of PHP and BASH and will be accepting this new version once completed.

This is an automated script for both virtual host creation in either Nginx or Apache. Other features will be added as we go to eventually encompass the following:

Features
-------------------------
* Apache Virtual Host creation
 * _Apache Installation available_
* Nginx Virtual Host creation
 * _Nginx Installation available_

To Do
-------------------------
* MySQL Database creation
 * _MySQL Installation available_
* MongoDB Database creation
 * _MongoDB Installation_
* Wordpress installation
* Drupal installation


Usage 
-------------------------

	python <( curl 	-H "host: example.com" \
		-H "x-http: apache" \
		-H "x-port: 80" \
		-H "x-docroot: /var/www/vhosts/example.com" \
		justnginx.com )


These headers are likely to change as better ones are thought up.  Check back for current usage. 

Defaults
-------------------------

A host header must always be specified when attempting a virtual host installation.  The following are default values for the remaining headers:

* x-http:    apache 
* x-port:    80
* x-docroot: /var/www/vhosts/%{domain_name}


Contact
-------------------------

Email: lindsey.anderson@rackspace.com
