#!/bin/bash
for i in $(seq 1 255)
 do
  snmpwalk -v2c -cpublic 192.168.179.$i iso.3.6.1.2.1.1.1.0 &
done
