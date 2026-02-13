#!/bin/bash

# Script to create files 522.txt through 525.txt with content from 500.txt

# Check if source file exists
if [ ! -f "500.txt" ]; then
    echo "Error: Source file 500.txt not found!"
    exit 1
fi

# Create files 522.txt through 525.txt
for i in {522..525}; do
    cp 500.txt "${i}.txt"
    echo "Created ${i}.txt"
done

echo "Successfully created files 522.txt, 523.txt, 524.txt, and 525.txt"
