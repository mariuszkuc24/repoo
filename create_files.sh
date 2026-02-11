#!/bin/bash

# Create files from 300 to 310 with content '1'
for i in {300..310}; do
    echo "1" > "${i}.txt"
done

echo "Files created: 300.txt through 310.txt"
ls -la *.txt
