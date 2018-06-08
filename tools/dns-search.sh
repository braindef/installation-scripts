#!/bin/bash
echo "$1"
dig "$1" |grep switch
