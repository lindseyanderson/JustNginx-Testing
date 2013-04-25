#!/bin/sh
# @file  : mysql_create_user.sh
# Create a MySQL user
# @date  : 04/24/2013
# @author: Lindsey Anderson
# @license: mysql_create_database.sh is a part of JustCurl
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

MYSQL=$(which mysql)
QUERY_STRING="CREATE USER ${mysql_user};"

# Execute the query
$MYSQL -e $QUERY_STRING
