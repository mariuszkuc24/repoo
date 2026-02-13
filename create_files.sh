#!/bin/bash

# Script to create files 570.txt through 575.txt with content from 500.txt

# Check if source file exists
if [ ! -f "500.txt" ]; then
    echo "Error: Source file 500.txt not found!"
    exit 1
fi

# Create files 570.txt to 575.txt
for i in {570..575}; do
    cp "500.txt" "${i}.txt"
    echo "Created ${i}.txt"

done

echo "All files created successfully!"
