#!/bin/bash
dns_server=212.60.61.246

dns_query=$(dig $1 | grep "^$1")
if [[ $dns_query == *"$1"* ]]
then
	dig $1 @$dns_server | grep "Query"|cut -d: -f2 |cut -dm -f1 |bc -l
else
	exit 1
fi

#allenfalls muss man noch das timeout in der zabbix_server.conf anpassen
