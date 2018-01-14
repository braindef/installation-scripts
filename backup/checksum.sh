#!/bin/bash
find . -name '*.txt' -exec  md5 '{}' >>$(date +%y%m%d).md5 \;
