#!/bin/sh
# @file  : mysql_grant_user.sh
# Configure user grants
# @date  : 04/24/2013
# @author: Lindsey Anderson
# @license: mysql_grant_user.sh is a part of JustCurl
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
USERNAME=${mysql_user}
DATABASE=${mysql_db}
DB_HOST=${mysql_db_host}

QUERY_STRING="GRANT ALL ON `${mysql_db}`.* TO '${USERNAME}'@'${DB_HOST}';"

$MYSQL -e $QUERY_STRING
