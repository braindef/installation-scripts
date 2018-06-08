#!/bin/bash
echo "$1"
dig "$1" @1.1.1.1 |grep switch
