#!/bin/bash

git remote set-url --push origin git@github.com:braindef/installation-scripts.git

git add -A
git commit -m "update"
git push

