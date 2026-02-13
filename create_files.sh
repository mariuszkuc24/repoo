#!/bin/bash

# Script to create files 550.txt through 555.txt with content from 500.txt

# Check if source file exists
if [ ! -f "500.txt" ]; then
    echo "Error: Source file 500.txt not found!"
    exit 1
fi

# Read content from 500.txt
content=$(cat 500.txt)

# Create files 550.txt through 555.txt
for i in {550..555}; do
    echo "$content" > "${i}.txt"
    echo "Created ${i}.txt"
done

echo "All files created successfully!"
