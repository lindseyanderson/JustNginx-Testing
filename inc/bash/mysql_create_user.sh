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
USERNAME=${mysql_user}
PASSWORD=${mysql_passwd}
HOST=${mysql_host}
COUNT=0

CHECK_USER_QUERY=$(${MYSQL} -e "SELECT user, host FROM `mysql`.user WHERE \
				user='${USERNAME}' LIMIT 1;")

for line in $CHECK_USER_QUERY; do
	LINE=$(echo -n $line | tr -d "\n")
	if [ $COUNT -eq 0 ]; then
		COUNT=$(( $COUNT + 1 ))
		LINE=$(echo $LINE + " " | tr -d "\n")
	else
		LINE=$($LINE + "\n")
		COUNT=0
	fi
done

if [ ! ${USER_EXISTS} ]; then
	QUERY_STRING="CREATE USER ${USERNAME}@${HOST} IDENTIFIED BY '${PASSWORD}';"
else
	exit 
fi
# Execute the query
$MYSQL -e $QUERY_STRING
