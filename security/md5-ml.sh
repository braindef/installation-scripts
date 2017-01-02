#!/bin/bash

mkdir temp && cd temp && wget -rl1 http://marclandolt.ch && md5deep -r . >md5.txt |md5sum md5.txt

