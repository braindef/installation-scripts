#!/bin/bash

cp pdns /etc/xen-tools/role.d/
cp default /etc/xen-tools/role.d/
cp zabbix /etc/xen-tools/role.d/
cp monitoring-client /etc/xen-tools/role.d/
cp development /etc/xen-tools/role.d/

chmod u+x /etc/xen-tools/role.d/pdns
chmod u+x /etc/xen-tools/role.d/default
chmod u+x /etc/xen-tools/role.d/zabbix
chmod u+x /etc/xen-tools/role.d/monitoring-client
chmod u+x /etc/xen-tools/role.d/development
