#!/bin/bash
ssh -L 2222:192.168.192.222:80 marc@braindef.ddns.net
chromium http://localhost:2222/zabbix/screens.php?ddreset=1
