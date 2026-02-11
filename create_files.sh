#!/bin/sh
# Script to create files 100.txt through 105.txt with content '1'

for i in 100 101 102 103 104 105
do
    echo "1" > "${i}.txt"
    echo "Created ${i}.txt"
done

echo "All files created successfully"