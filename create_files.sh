#!/bin/sh
# Script to create files 106-110.txt with content '1'

for i in 106 107 108 109 110
do
  echo "1" > "${i}.txt"
  echo "Created ${i}.txt"
done

echo "All files created successfully"