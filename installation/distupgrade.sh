#!/bin/bash

cp /etc/apt/sources.list /etc/apt/sources.list-$(date +%y%m%d%H%M%S)


sed -e 's/jessie/stretch/g' /etc/apt/sources.list
sed -i -e 's/jessie/stretch/g' /etc/apt/sources.list



