#!/bin/bash

# Script to create files 75.txt through 80.txt with content '1'

for i in {75..80}; do
    echo "1" > "${i}.txt"
    echo "Created ${i}.txt"
done

echo "All files created successfully!"