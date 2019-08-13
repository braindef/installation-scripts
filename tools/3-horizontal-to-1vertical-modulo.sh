#!/bin/bash
counter=2
for i in $(cat dirs.csv)
do
  counter=$((counter+1))
  modulo=$(($counter%3))
if [ "$modulo" -eq "0" ]           # no need for brackets
then
    echo -n "$i "
fi
if [ "$modulo" -eq "1" ]           # no need for brackets
then
    echo -n "$i "
fi
if [ "$modulo" -eq "2" ]           # no need for brackets
then
    echo "$i"
fi
done

